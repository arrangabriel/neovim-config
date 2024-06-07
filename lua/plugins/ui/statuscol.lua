return {
	"luukvbaal/statuscol.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	lazy = false,
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = true } },
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ sign = { namespace = { "diagnostic" }, maxwidth = 1, auto = false } },
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
			},
			ft_ignore = {
				"NvimTree",
			},
		})
	end,
}
