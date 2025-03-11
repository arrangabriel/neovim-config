return {
	"dupeiran001/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup()
		vim.cmd("colorscheme nord")
	end,
}
