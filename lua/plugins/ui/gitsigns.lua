return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text_pos = "right_align",
			delay = 500,
		},
		on_attach = function(bufnr)
			require("utils").map_with_prefix("Git: ", { buffer = bufnr })(
				"n",
				"<leader>tb",
				require("gitsigns").toggle_current_line_blame,
				"[b]lame line"
			)
		end,
	},
}
