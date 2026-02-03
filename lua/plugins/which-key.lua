local spec = {
    { "<leader>g", name = "[g]oto", group = true },
    { "<leader>s", name = "[s]earch", group = true },
    { "<leader>t", name = "[t]oggle", group = true },
    { "ø", name = "previous", group = true },
    { "æ", name = "next", group = true },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = false,
		icons = {
			mappings = false,
			separator = ">",
		},
		spec = spec,
        expand = 2,
	},
}
