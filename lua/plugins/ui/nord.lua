return {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({
			on_highlights = function(highlights, c)
				highlights.NormalFloat = { fg = c.snow_storm.origin, bg = c.polar_night.brighter }
			end,
		})
		vim.cmd.colorscheme("nord")
	end,
	install = { "nord" },
}
