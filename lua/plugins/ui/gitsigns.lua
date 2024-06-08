local utils = require("utils")

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "right_align",
				delay = 500,
			},
			on_attach = function(bufnr)
				local function map(mode, keys, action, desc)
					local opts = {
						buffer = bufnr,
						desc = "Git: " .. desc,
					}
					utils.map(mode, keys, action, opts)
				end

				map("n", ">c", function()
					if vim.wo.diff then
						vim.cmd.normal({ ">c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "next hunk")

				map("n", "<c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "prev hunk")

				map("n", "<leader>hs", gitsigns.stage_hunk, "[h]unk [s]tage")
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, "[h]unk [u]nstage")
				map("n", "<leader>hr", gitsigns.reset_hunk, "[h]unk [r]eset!")
				map("n", "<leader>hp", gitsigns.preview_hunk, "[h]unk [p]review")
				map("n", "<leader>hd", gitsigns.diffthis, "[d]iff")
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, "[d]iff")
				map("n", "<leader>td", gitsigns.toggle_deleted, "[d]eleted")
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, "blame line")
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "[b]lame line")

				map("n", "<leader>hS", gitsigns.stage_buffer, "stage buffer")
				map("n", "<leader>hR", gitsigns.reset_buffer, "reset buffer!")

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[h]unk [s]tage")
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[h]unk [r]eset!")

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "inner hunk")
			end,
		})
	end,
}
