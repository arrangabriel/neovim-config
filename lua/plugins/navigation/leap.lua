return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
		require("leap").add_default_mappings(true)
	end,
}
