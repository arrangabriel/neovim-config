local utils = require("utils")

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			enure_installed = {
				"codelldb",
			},
		})

		local map = utils.map_with_prefix("Debug: ")

		map("n", "<F5>", dap.continue, "Start/Continue")
		map("n", "<F1>", dap.step_into, "Step into")
		map("n", "<F2>", dap.step_over, "Step over")
		map("n", "<F3>", dap.step_out, "Step out")
		map("n", "<leader>b", dap.toggle_breakpoint, "Toggle breakpoint")
		map("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition"))
		end, "Set conditional breakpoint")

		-- vim.keymap.set("n", "<leader>bb", dapui.toggle, opts)
		-- vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint, opts)
		-- vim.keymap.set("n", "<leader>bn", dap.continue, opts)
		-- vim.keymap.set("n", "<leader>bl", dap.step_over, opts)
		-- vim.keymap.set("n", "<leader>bj", dap.step_into, opts)
		-- vim.keymap.set("n", "<leader>bk", dap.step_out, opts)
		-- vim.keymap.set("n", "<leader>bh", dap.step_back, opts)
		-- vim.keymap.set("n", "<leader>b.", dap.run_last, opts)

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		map("n", "<F7>", dapui.toggle, "See last session result")

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
