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
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			markdown = { "prettierd" },
			yaml = { "prettierd" },
			elixir = { "mix" },
			eelixir = { "mix" },
            cs = { "csharpier" },
			["_"] = { "trim_whitespace" },
		},
	},
}
