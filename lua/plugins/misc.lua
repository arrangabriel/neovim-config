-- Keymap help
local which_key_config = {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		spec = {
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>t", group = "[t]oggle" },
			{ "<leader>g", group = "[g]oto" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "view buffer local keymaps",
		},
	},
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
