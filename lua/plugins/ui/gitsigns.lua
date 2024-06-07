local utils = require("utils")

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			on_attach = function(bufnr)
				local function map(mode, keys, action, opts)
					opts = opts or {}
					opts.buffer = bufnr
					utils.map(mode, keys, action, opts)
				end

				map("n", ">c", function()
					if vim.wo.diff then
						vim.cmd.normal({ ">c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "<c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[h]unk [s]tage" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[h]unk [u]nstage" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[h]unk [r]eset!" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[h]unk [p]review" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "[d]iff" })
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "[d]iff" })
				map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "[d]eleted" })
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "blame line" })
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[b]lame line" })

				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage buffer" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset buffer!" })

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[h]unk [s]tage" })
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[h]unk [r]eset!" })

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
