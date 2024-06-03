-- TODO: clean this up
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>tf",
			function()
				require("neo-tree.command").execute({ toggle = true, source = "filesystem" })
			end, -- TODO only close if the window is currently focused
			desc = "[F]ile-tree",
		},
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	config = function()
		require("neo-tree").setup({
			enable_refresh_on_write = true,
			popup_border_style = "single", -- "double", "none", "rounded", "shadow", "single" or "solid"
			default_component_configs = {
				git_status = {
					symbols = {
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						unstaged = "󰏫",
					},
				},
				icon = { folder_empty = "" },
			},
			commands = {
				example = function()
					print("hello")
				end,
			}, -- available everywhere
			window = {
				width = 30,
				mapping_options = { noremap = true, nowait = true },
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = true } },
					["a"] = { "add", config = { show_path = "relative" } },
					["c"] = { "copy", config = { show_path = "relative" } },
					["m"] = { "move", config = { show_path = "relative" } },
					["<esc>"] = "close_window",
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = true,
				filtered_items = {
					hide_gitignored = false,
					hide_by_pattern = { ".idea/*" },
				},
				window = {
					fuzzy_finder_mappings = {
						["<C-k>"] = "move_cursor_up",
						["<C-j>"] = "move_cursor_down",
					},
				},
			},
			buffers = {
				group_empty_dirs = true,
				show_unloaded = true,
			},
		})
	end,
}
