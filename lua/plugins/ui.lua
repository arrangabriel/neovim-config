require("utils")

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {
                "<leader>e",
                function() require("neo-tree.command").execute { toggle = true, source = "filesystem" } end, -- TODO only close if the window is currently focused
                desc = "NeoTree files",
            },
            {
                "<leader>b",
                function() require("neo-tree.command").execute { toggle = true, position = "float", source = "buffers" } end,
                desc = "NeoTree buffers",
            },
            {
                "<leader>g",
                function() require("neo-tree.command").execute { toggle = true, position = "float", source = "git_status" } end,
                desc = "NeoTree git status",
            },
        },
        init = function()
            SetVariable("neo_tree_remove_legacy_commands", 1)
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        config = function()
            require("neo-tree").setup {
                close_floats_on_escape_key = true,
                enable_refresh_on_write = true,
                popup_border_style = "single", -- "double", "none", "rounded", "shadow", "single" or "solid"
                default_component_configs = {
                    git_status = { symbols = { renamed = "󰑕", unstaged = "󰏫", } },
                    icon = { folder_empty = "" }
                },
                source_selector = { statusline = false },              -- TODO add statusline
                commands = { example = function() print "hello" end }, -- available everywhere
                window = {
                    width = 35,
                    mapping_options = { noremap = true, nowait = true },
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = true } },
                        ["t"] = "open_tabnew",
                        ["z"] = "close_all_nodes",
                        ["a"] = { "add", config = { show_path = "relative" } },
                        ["c"] = { "copy", config = { show_path = "relative" } },
                        ["m"] = { "move", config = { show_path = "relative" } },
                        ["<esc>"] = "close_window"
                    },
                    filesystem = {
                        follow_current_file = true,
                        filtered_items = {
                            hide_gitignored = false,
                            hide_by_pattern = { ".idea/*" },
                            never_show = { ".DS_Store" },
                        },
                    },
                    buffers = {
                        follow_current_file = true,
                        group_empty_dirs = true,
                        show_unloaded = true,
                    }
                }
            }
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true
            require("indent_blankline").setup()
        end
    },
    {
        "shaunsingh/nord.nvim",
        init = function() vim.cmd.colorscheme("nord") end
    }
}
