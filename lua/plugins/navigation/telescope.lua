local utils = require("utils")

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
					n = {
						["<C-h>"] = "which_key",
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		local map = utils.map_with_prefix("telescope: ")
		map("n", "<leader><leader>", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, "fuzzily search in current buffer")
		map("n", "<leader>sr", builtin.resume, "[r]esume previous")
		map("n", "<leader>sg", builtin.live_grep, "[g]rep")
		map("n", "<leader>sf", builtin.find_files, "[f]iles")

		map("n", "<leader>sh", builtin.help_tags, "[h]elp")
		map("n", "<leader>sk", builtin.keymaps, "[k]eymaps")
		map("n", "<leader>sd", builtin.diagnostics, "[d]iagnostics")
		map("n", "<leader>sp", builtin.oldfiles, "[p]reviously opened")
		map("n", "<leader>st", builtin.builtin, "[t]elescope pickers")
		map("n", "<leader>sb", builtin.buffers, "open [b]uffers")

		map("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, "[n]eovim files")
	end,
}
