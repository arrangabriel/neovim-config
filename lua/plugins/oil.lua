-- TODO: Change c-h keybind

return {
	"stevearc/oil.nvim",
	---@Module "oil"
	---@oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},
		columns = {},
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<leader>o"] = "actions.close",
			["<C-v>"] = { "actions.select", opts = { vertical = true, close = true } },
			["<C-b>"] = { "actions.select", opts = { horizontal = true, close = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["-"] = { "actions.parent", mode = "n" },
			["g-"] = { "actions.open_cwd", mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
		},
		use_default_keymaps = false,
	},
	lazy = false,
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)
		require("utils").map("n", "<leader>o", oil.open, { desc = "[o]il" })
	end,
}
