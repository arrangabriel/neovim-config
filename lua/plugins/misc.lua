-- Keymap help
local which_key_config = {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local which_key = require("which-key")
		which_key.setup()

		which_key.register({
			["<leader>t"] = { name = "[t]oggle", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
		})
	end,
}

-- Various utility plugins
local mini_config = {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.surround").setup()
	end,
}

return {
	which_key_config,
	mini_config,
	-- Repeat plugin actions with '.'
	"tpope/vim-repeat",
}
