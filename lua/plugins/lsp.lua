local utils = require("utils")

local setup_lsp_keybinds = function(event)
	local map = utils.map_with_opts({ buffer = event.buf })

	map("n", "<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
	map("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, "hover documentation")
	map("n", "<leader>gd", vim.lsp.buf.definition, "[d]efinition")
	map("n", "<leader>gr", function()
		vim.lsp.buf.references(nil, {
			on_list = function(items, title, context)
				require("trouble").open("lsp_references", {
					items = items,
					title = title,
					context = context,
				})
			end,
		})
	end, "[r]eferences")
	--  In C this would take you to the header.
	map("n", "<leader>gD", vim.lsp.buf.declaration, "[D]eclaration")
	map("n", "<leader>gi", vim.lsp.buf.implementation, "[i]mplementations")

	-- The following two autocommands are used to highlight references of the hovered symbol
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	if client.server_capabilities.documentHighlightProvider then
		local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
			end,
		})
	end

	local inlay_hints_default_off = {}
	local inlay_hints_default = not vim.tbl_contains(inlay_hints_default_off, vim.bo[event.buf].filetype)
	if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(inlay_hints_default)
		map("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "inlay [h]ints")
		do
		end
	end

	-- https://gist.github.com/MariaSolOs/2e44a86f569323c478e5a078d0cf98cc
	if client.server_capabilities.completionProvider then
		vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		map("i", "<C-n>", function()
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			else
				vim.lsp.completion.get()
			end
		end, "trigger/select next completion")
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} }, -- LSP status notifications
        "folke/trouble.nvim", -- LSP diagnostics list
	},
	config = function()
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("clangd")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("pyright")
		vim.lsp.enable("omnisharp")

		vim.lsp.config("expert", {
			cmd = { "expert", "--stdio" },
			root_markers = { "mix.exs", ".git" },
			filetypes = { "elixir", "eelixir", "heex" },
		})
		vim.lsp.enable("expert")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = setup_lsp_keybinds,
		})
	end,
}
