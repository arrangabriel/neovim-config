local utils = require("utils")

return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			html = { mode = "background" },
		})

		utils.map("n", "<leader>tc", function()
			vim.cmd([[ColorizerToggle]])
		end, { desc = "[c]olorizer" })
	end,
}
