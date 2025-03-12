-- TODO: Close after vertical or horizontal select.
return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<leader>o"] = "actions.close",
			["<CR>"] = "actions.select",
			["<S-CR>"] = { "actions.select", opts = { vertical = true, close = true } },
			["<C-S-CR>"] = { "actions.select", opts = { horizontal = true, close = true } },
			["<C-p>"] = "actions.preview",
			["<C-r>"] = "actions.refresh",
			["<C-d>"] = { "actions.cd", mode = "n" },
			["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		use_default_keymaps = false,
	},
	config = function(_, opts)
		local utils = require("utils")
		local oil = require("oil")
		oil.setup(opts)
		utils.map("n", "<leader>o", oil.open)
	end,
}
