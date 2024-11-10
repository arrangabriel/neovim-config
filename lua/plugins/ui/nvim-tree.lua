local utils = require("utils")

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	priority = 1001,
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function custom_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local map = utils.map_with_prefix("", {
				buffer = bufnr,
				noremap = true,
				silent = true,
				nowait = true,
			})

			map("n", "?", api.tree.toggle_help, "help")
			map("n", "R", api.tree.reload, "[R]efresh")
			map("n", "o", api.node.run.system, "system [o]pen")

			map("n", "<CR>", api.node.open.edit, "open")
			map("n", "v", api.node.open.vertical, "open [v]vertical")
			map("n", "h", api.node.open.horizontal, "open [h]orizontal")
			map("n", "p", api.node.open.preview, "open [p]review")
			map("n", "gd", api.tree.change_root_to_node, "cd")
			map("n", "gu", api.tree.change_root_to_parent, "cd ..")
			map("n", "<BS>", api.node.navigate.parent_close, "close directory")

			map("n", "C", api.fs.create, "[C]reate")
			map("n", "d", api.fs.remove, "[d]elete")

			map("n", "r", api.fs.rename, "[r]ename")
			map("n", "b", api.fs.rename_basename, "rename [b]asename")

			map("n", "c", api.fs.copy.node, "[c]opy")
			map("n", "x", api.fs.cut, "cut")
			map("n", "p", api.fs.paste, "[p]aste")

			map("n", "H", api.tree.toggle_hidden_filter, "toggle filter: [H]idden")
			map("n", "I", api.tree.toggle_gitignore_filter, "toggle filter: Git [I]gnored")

			--vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
			--vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
		end

		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			filters = {
				dotfiles = true,
				git_ignored = false,
			},
			on_attach = custom_on_attach,
		})

		local map = utils.map_with_prefix("nvim-tree: ", { silent = true, noremap = true })
		local api = require("nvim-tree.api")

		map("n", "<leader>tf", api.tree.toggle, "[f]iles")
		map("n", "<leader>gf", function()
			api.tree.find_file({ open = true, focus = true })
		end, "current [f]ile")
	end,
}
