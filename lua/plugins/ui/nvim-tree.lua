local utils = require("utils")

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	priority = 1001,
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
				git_ignored = false,
			},
		})

		utils.map("n", "<leader>tf", require("nvim-tree.api").tree.toggle, { desc = "[f]iles" })
	end,
}
