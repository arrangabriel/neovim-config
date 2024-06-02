-- Keymap help
local which_key_config = {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local plugin = require("which-key")
		plugin.setup()

		plugin.register({
			["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		})
	end,
}

-- Various utility plugins
local mini_config = {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.surround").setup()
		--require("mini.statusline").setup { use_icons = true }
	end,
}

return {
	which_key_config,
	-- Repeat plugin actions with '.'
	"tpope/vim-repeat",
}
