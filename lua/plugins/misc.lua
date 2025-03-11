local mini_config = {
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
		-- Move lines with Alt + h/j/k/l
		require("mini.move").setup({
			mappings = {
				left = "˛", -- Alt + h
				line_left = "˛",
				right = "ﬁ", -- Alt + l
				line_right = "ﬁ",
				up = "ª", -- Alt + k
				line_up = "ª",
				down = "√", -- Alt + j
				line_down = "√",
			},
		})
		-- Git diff in gutter (and more)
		require("mini.diff").setup()
		-- Automatic delimiter pair creation
		require("mini.pairs").setup()
	end,
}

-- TODO: explore https://github.com/folke/snacks.nvim/
local snacks_config = {
	"folke/snacks.nvim",
	---@module "snacks"
	---@type snacks.Config
	opts = {
		input = {
			prompt_pos = "left",
			icon_pos = false,
		},
		dashboard = {
			sections = {
				{ title = "Projects", section = "projects", indent = 2 },
				{ title = "Recent Files", section = "recent_files", indent = 2 },
			},
		},
	},
}

return {
	mini_config,
	snacks_config,
}
