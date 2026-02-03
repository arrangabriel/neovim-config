local base = { fg = "#ffffff" }
local theme = { normal = { a = base, b = base, c = base } }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			globalstatus = true,
			disabled_filetypes = { "TelescopePrompt", "mason", "qf" },
			component_separators = "｜",
			section_separators = "",
			theme = theme,
		},
		sections = {
			lualine_a = {
				{ "filename", path = 1, color = { gui = "bold" }, separator = "" },
				{
					function()
						return "on"
					end,
					padding = 0,
					cond = function()
						return vim.b.git_root ~= nil
					end,
					separator = "",
				},
				{ "branch", icons_enabled = false, color = { gui = "bold" } },
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				"location",
				{ "diff", colored = false },
				{ "diagnostics", colored = false },
			},
		},
		extensions = { "oil" },
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
	end,
}
