return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		local opencode = require("opencode")

		local ask_action = function()
			opencode.ask("@this: ", { submit = true })
		end

		local send_action = function(postfix)
			return function()
				return opencode.operator("@this ") .. postfix
			end
		end

		vim.keymap.set({ "n", "x" }, "<leader>ax", opencode.select, { desc = "e[x]ecute action" })
		vim.keymap.set({ "n", "x" }, "<leader>aa", ask_action, { desc = "[a]sk (auto-submit)" })
		vim.keymap.set({ "n", "x" }, "<leader>as", send_action(""), { desc = "send [s]elected", expr = true })
		vim.keymap.set("n", "<leader>al", send_action("_"), { desc = "send [l]ine", expr = true })
	end,
}
