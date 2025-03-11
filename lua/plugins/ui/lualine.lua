return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			globalstatus = true,
			disabled_filetypes = { "NvimTree", "TelescopePrompt" },
			component_separators = "｜",
			section_separators = "",
			theme = "nord",
		},
		sections = {
			lualine_a = { { "filename", path = 1, color = { gui = "bold" } } },
			lualine_b = {
				{ "branch", icons_enabled = false, color = { gui = "bold" } },
			},
			lualine_c = { "diagnostics", "diff" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
