return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "cpp", "rust", "lua", "kotlin", "markdown" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"
		vim.o.foldlevel = 99

		local bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg
		local fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg
		vim.api.nvim_set_hl(0, "Folded", {
			bg = bg,
			fg = fg,
		})
	end,
}
