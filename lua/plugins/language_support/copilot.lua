return {
	"zbirenbaum/copilot.lua",
	---@module 'copilot.config'
	---@type copilot_config
	opts = {
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<C-f>",
			},
		},
		panel = {
			keymap = {
				open = "<C-S-a>",
			},
		},
	},
}
