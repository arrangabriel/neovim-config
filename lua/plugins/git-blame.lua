return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,
	},
	keys = {
		{ "<leader>tb", "<cmd>GitBlameToggle<cr>", desc = "git [b]lame" },
	},
}
