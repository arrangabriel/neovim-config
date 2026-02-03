return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		-- Keys to be used in both normal and insert mode
		local key_help = "g?"
		local key_toggle_preview = "π" -- Option + p on macos
		local key_open = "<CR>"
		local key_open_v = "<C-v>"
		local key_open_h = "<C-b>"
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

		local map = function(key, func, desc)
			return require("utils").map_with_prefix("telescope: ")("n", "<leader>" .. key, func, desc)
		end
		map("<leader>", builtin.current_buffer_fuzzy_find, "fuzzily search in current buffer")
		map("sr", builtin.oldfiles, "[r]ecent")
		map("sg", builtin.live_grep, "[g]rep")
		map("sw", builtin.grep_string, "[w]ord under cursor")
		map("ssy", require("telescope.builtin").lsp_dynamic_workspace_symbols, "workspace [sy]mbols")
		map("sst", builtin.git_status, "git [st]atus")
		-- TODO: Possibly add this, to show hidden files except .git
		-- map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
		map("sf", builtin.find_files, "[f]iles")
		map("sh", builtin.help_tags, "[h]elp")
		map("sk", builtin.keymaps, "[k]eymaps")
		map("sd", builtin.diagnostics, "[d]iagnostics")
		map("st", builtin.builtin, "[t]elescope pickers")
		map("sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, "[c]onfig files")
	end,
}
