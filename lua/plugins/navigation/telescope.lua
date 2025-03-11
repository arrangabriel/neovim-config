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
		-- Keys to be used in both normal and insert mode
		local key_help = "<C-h>"
		local key_toggle_preview = "π" -- Option + p on macos
		local key_open = "<CR>"
		local key_open_v = "<S-CR>"
		local key_open_h = "<C-S-CR>"
		local actions = require("telescope.actions")
		local actions_layout = require("telescope.actions.layout")
		local mappings = {
			i = {
				[key_help] = actions.which_key,
				[key_toggle_preview] = actions_layout.toggle_preview,
				[key_open] = actions.select_default,
				[key_open_v] = actions.select_vertical,
				[key_open_h] = actions.select_horizontal,
			},
			n = {
				[key_help] = actions.which_key,
				[key_toggle_preview] = actions_layout.toggle_preview,
				[key_open] = actions.select_default,
				[key_open_v] = actions.select_vertical,
				[key_open_h] = actions.select_horizontal,
			},
		}

		local themes = require("telescope.themes")

		local telescope = require("telescope")
		telescope.setup({
			defaults = themes.get_ivy({
				mappings = mappings,
				layout_config = { height = 0.5 },
			}),
			pickers = { current_buffer_fuzzy_find = themes.get_dropdown({ previewer = false }) },
			extensions = { ["ui-select"] = { themes.get_dropdown() } },
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		local map = utils.map_with_prefix("telescope: ")
		map("n", "<leader><leader>", builtin.current_buffer_fuzzy_find, "fuzzily search in current buffer")
		map("n", "<leader>sr", builtin.oldfiles, "[r]ecent files")
		map("n", "<leader>sg", builtin.live_grep, "[g]rep")
		map("n", "<leader>sf", builtin.find_files, "[f]iles")
		map("n", "<leader>sh", builtin.help_tags, "[h]elp")
		map("n", "<leader>sk", builtin.keymaps, "[k]eymaps")
		map("n", "<leader>sd", builtin.diagnostics, "[d]iagnostics")
		map("n", "<leader>st", builtin.builtin, "[t]elescope pickers")
		map("n", "<leader>sb", builtin.buffers, "open [b]uffers")
		map("n", "<leader>sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, "[c]onfig files")
	end,
}
