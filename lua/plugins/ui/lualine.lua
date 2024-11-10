local utils = require("utils")

local function navic_breadcrumbs()
	if not require("nvim-navic").is_available() then
		return ""
	end
	return require("nvim-navic").get_location()
end

local sections = {
	lualine_a = {},
	lualine_b = {
		{
			"filename",
			path = 1,
			color = { gui = "bold" },
		},
	},
	lualine_c = {
		"diagnostics",
		"diff",
		{ navic_breadcrumbs },
	},

	lualine_x = {},
	lualine_y = {
		{
			"branch",
			icons_enabled = false,
			color = { gui = "bold" },
		},
	},
	lualine_z = {},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
		"gbprod/nord.nvim",
	},
	config = function()
		local bg = require("nord.colors").default_bg
		local custom_nord = require("lualine.themes.nord")
		local fg = custom_nord.normal.b.fg

		local function set(t)
			t.a.bg = bg
			t.a.fg = fg
		end

		set(custom_nord.normal)
		set(custom_nord.insert)
		set(custom_nord.visual)
		set(custom_nord.replace)
		custom_nord.command = { a = {} }
		set(custom_nord.command)

		require("lualine").setup({
			options = {
				globalstatus = true,
				theme = custom_nord,
				disabled_filetypes = {
					"NvimTree",
				},
				component_separators = "｜",
				section_separators = "",
			},
			sections = sections,
		})
	end,
}
