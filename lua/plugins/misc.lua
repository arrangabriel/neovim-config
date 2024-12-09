-- TODO:
-- https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules
-- https://www.reddit.com/r/neovim/comments/1h173ez/favorite_modules_from_mininvim/

local mini_config = {
	"echasnovski/mini.nvim",
	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
	end,
}

return {
	mini_config,
}
