return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("nord")
		-- Color inlay hints the same way as comments
		require("nord.util").highlight("LspInlayHint", {
			fg = require("nord.colors").nord3_gui_bright,
			style = "italic",
		})
	end,
}
