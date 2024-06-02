require("utils")

return {
	"voldikss/vim-floaterm",
	keys = {
		{
			"<C-t>",
			"<cmd>FloatermToggle<cr>",
			mode = { "n", "t" },
			desc = "Toggle floating terminal",
		},
	},
	config = function()
		SetVariable("floaterm_title", "") --"term: $1/$2")
		SetVariable("floaterm_width", 0.8)
		SetVariable("floaterm_height", 0.8)
	end,
}
