local prettier = "prettier"

return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[f]ormat buffer",
		},
	},
	opts = {
		log_level = vim.log.levels.TRACE,
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Languages that do not have a "default" style
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		-- add these to the mason config to ensure their installation
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { prettier },
			javascriptreact = { prettier },
			typescript = { prettier },
			typescriptreact = { prettier },
			css = { prettier },
			html = { prettier },
			markdown = { prettier },
			["_"] = { "trim_whitespace" },
		},
		formatters = {
			prettier = {
				append_args = { "--prose-wrap", "always" },
			},
		},
	},
}
