-- Keymap help
local which_key_config = {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		spec = {
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>t", group = "[t]oggle" },
			{ "<leader>g", group = "[g]oto" },
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 10,
			},
			presets = {
				windows = true,
				z = true,
				g = true,
				operators = false,
				motions = false,
				text_objects = false,
				nav = false,
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "view buffer local keymaps",
		},
	},
}

return {
	which_key_config,
	-- Repeat plugin actions with '.'
	"tpope/vim-repeat",
}
