return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	init = function()
		vim.opt.foldcolumn = "1"
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.opt.fillchars = {
			eob = " ",
			fold = " ",
			foldopen = "",
			foldsep = " ",
			foldclose = "",
		}
	end,
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},
}
