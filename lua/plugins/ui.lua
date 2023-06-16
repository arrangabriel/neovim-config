require("utils")

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
            require("neo-tree").setup {
                close_if_last_window = false,
                enable_git_status = true,
                enable_diagnostics = true,
                open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
                sort_case_insensitive = true,
                default_component_configs = {
                    container = {
                        enable_character_fade = true
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted   = "✖", -- this can only be used in the git_status source
                            renamed   = "", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored   = "",
                            unstaged  = "",
                            staged    = "",
                            conflict  = "",
                        }
                    },
                    icon = { folder_empty = "" }
                },
                -- A list of functions, each representing a global custom command
                -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
                -- see `:h neo-tree-global-custom-commands`
                window = {
                    position = "left",
                    width = 30,
                    mapping_options = { noremap = true, nowait = true },
                    mappings = {
                        ["<space>"] = { "toggle_node", nowait = false },
                        ["<cr>"] = "open",
                        ["<esc>"] = "revert_preview",
                        --["P"] = { "toggle_preview", config = { use_float = true } },
                        ["l"] = "focus_preview",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        ["a"] = { "add", config = { show_path = "relative" } },
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                        -- ["c"] = {
                        --  "copy",
                        --  config = {
                        --    show_path = "none" -- "none", "relative", "absolute"
                        --  }
                        --}
                        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                    },
                    filesystem = {
                        filtered_items = {
                            visible = false, -- when true, they will just be displayed differently than normal items
                            hide_dotfiles = false,
                            hide_gitignored = false,
                            hide_hidden = true,
                            hide_by_name = {},
                            hide_by_pattern = {},
                            always_show = {},
                            never_show = {},
                        },
                        window = {
                            mappings = {
                                ["<bs>"] = "navigate_up",
                                ["."] = "set_root",
                                ["H"] = "toggle_hidden",
                                ["/"] = "fuzzy_finder",
                                ["D"] = "fuzzy_finder_directory",
                                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                                -- ["D"] = "fuzzy_sorter_directory",
                                ["f"] = "filter_on_submit",
                                ["<c-x>"] = "clear_filter",
                                ["[g"] = "prev_git_modified",
                                ["]g"] = "next_git_modified",
                            },
                            fuzzy_finder_mappings = {
                                -- define keymaps for filter popup window in fuzzy_finder_mode
                                ["<down>"] = "move_cursor_down",
                                ["<C-n>"] = "move_cursor_down",
                                ["<up>"] = "move_cursor_up",
                                ["<C-p>"] = "move_cursor_up",
                            },
                        },
                    },
                    buffers = {
                        follow_current_file = true,
                        group_empty_dirs = true,
                        show_unloaded = true,
                        window = {
                            mappings = {
                                ["bd"] = "buffer_delete",
                                ["<bs>"] = "navigate_up",
                                ["."] = "set_root",
                            }
                        }
                    }
                }
            }
            vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true
            require("indent_blankline").setup {}
        end
    },
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd [[colorscheme nord]]
        end,
    }
}
