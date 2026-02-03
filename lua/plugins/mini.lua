return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		-- Highlight hex colors
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
		-- Git diff in gutter (and more)
		require("mini.diff").setup()
		-- Automatic delimiter pair creation
		require("mini.pairs").setup()
	end,
}
