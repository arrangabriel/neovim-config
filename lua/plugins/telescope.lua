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
		"folke/trouble.nvim",
	},
	config = function()
		local actions = require("telescope.actions")

		local mappings = {
			["g?"] = actions.which_key,
			["<CR>"] = actions.select_default,
			["<C-v>"] = actions.select_vertical,
			["<C-s>"] = actions.select_horizontal,
			["<C-t>"] = require("trouble.sources.telescope").open,
		}

		local themes = require("telescope.themes")
		local telescope = require("telescope")
		telescope.setup({
			defaults = themes.get_ivy({ mappings = { i = mappings, n = mappings }, layout_config = { height = 0.5 } }),
			extensions = { ["ui-select"] = { themes.get_dropdown() } },
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		local builtin = require("telescope.builtin")

		local map = function(key, func, desc)
			return require("utils").map_with_prefix("telescope: ")("n", "<leader>" .. key, func, desc)
		end
		map("sf", builtin.find_files, "[f]iles")
		map("sg", builtin.live_grep, "[g]rep")
		map("sr", builtin.oldfiles, "[r]ecent")
		map("sst", builtin.git_status, "git [st]atus")
		map("sh", builtin.help_tags, "[h]elp")
		map("sk", builtin.keymaps, "[k]eymaps")
		map("st", builtin.builtin, "[t]elescope pickers")
		map("sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, "[c]onfig files")
		-- TODO: Possibly add this, to show hidden files except .git
		-- map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
	end,
}
