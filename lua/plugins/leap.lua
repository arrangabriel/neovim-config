return {
	"https://codeberg.org/andyg/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
	end,
	keys = {
		{ "s", "<Plug>(leap)", mode = { "n", "x", "o" }, desc = "Leap" },
		{ "S", "<Plug>(leap-anywhere)", mode = { "n", "x", "o" }, desc = "Leap anywhere" },
	},
}
