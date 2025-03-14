local utils = require("utils")

-- TODO: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- Status notifications
		{ "j-hui/fidget.nvim", opts = {} },
		-- Lua Neovim integration
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = utils.map_with_prefix("LSP: ", { buffer = event.buf })

				-- Rename the variable under your cursor.
				map("n", "<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("n", "<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
				-- Opens a popup that displays documentation about the word under your cursor
				map("n", "K", vim.lsp.buf.hover, "hover documentation")

				-- Jump to the definition(s) of the word under your cursor.
				map("n", "gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
				-- Find reference(s) for the word under your cursor.
				map("n", "gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
				-- Jump to the type of the word under your cursor.
				map("n", "gt", require("telescope.builtin").lsp_type_definitions, "[g]oto [t]ype")

				--  Goto declaration, in C this would take you to the header.
				map("n", "gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
				-- Jump to the implementation(s) of the word under your cursor.
				map("n", "gI", require("telescope.builtin").lsp_implementations, "[g]oto [I]mplementation")

				-- Fuzzy find all the symbols in your current document.
				map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
				-- Similar to document symbols, except searches over your entire project.
				map(
					"n",
					"<leader>ws",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					"[w]orkspace [s]ymbols"
				)

				-- The following two autocommands are used to highlight references of the hovered symbol
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
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

				local inlay_hint_default_off = {
					"cpp",
				}
				local inlay_hints_default = not vim.tbl_contains(inlay_hint_default_off, vim.bo[event.buf].filetype)
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					vim.lsp.inlay_hint.enable(inlay_hints_default)
					map("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "inlay [h]ints")
				end
			end,
		})

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettierd",
			},
		})

		-- cmd (table): Override the default command used to start the server
		-- filetypes (table): Override the default list of associated filetypes for the server
		-- capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		-- settings (table): Override the default settings passed when initializing the server.
		-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
		local servers = {
			clangd = {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			pyright = {},
			rust_analyzer = {},
			marksman = {},
		}

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server_opts = servers[server_name] or {}
					server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
					require("lspconfig")[server_name].setup(server_opts)
				end,
			},
			automatic_installation = false,
		})
	end,
}
