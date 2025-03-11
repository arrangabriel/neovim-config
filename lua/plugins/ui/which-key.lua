return {
	"folke/which-key.nvim",
	event = "VimEnter",
	---@class wk.Opts
	opts = {
		spec = {
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>t", group = "[t]oggle" },
			{ "<leader>g", group = "[g]oto" },
		},
		preset = "modern",
		win = {
			title_pos = "left",
		},
		keys = {
			scroll_up = "<C-p>",
			scroll_down = "<C-n>",
		},
		-- Expand groups when <= n mappings
		expand = 2,
		icons = {
			mappings = false,
			rules = false,
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
		sort = { "alphanum", "local", "group", "mod" },
		filter = function(mapping)
			-- Hide silent mappings
			if mapping.silent == 1 then
				return false
			end

			local hidden = { "&", "Y" }
			for _, key in ipairs(hidden) do
				if mapping.lhs == key then
					return false
				end
			end

			return true
		end,
	},
}
