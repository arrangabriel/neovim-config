-- Plugins:
--   Neotree          - file browser
--   Lualine          - fancy statusline
--   Indent_blankline - indentation guiding lines
--   Nord             - theme

require("utils")

local neotree_config = {
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
                git_status = {
                    symbols = {
                        added    = "",
                        deleted  = "",
                        modified = "",
                        renamed  = "",
                        unstaged = "󰏫"
                    }
                },
                icon = { folder_empty = "" }
            },
            commands = { example = function() print "hello" end }, -- available everywhere
            window = {
                width = 30,
                mapping_options = { noremap = true, nowait = true },
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = true } },
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
                    group_empty_dirs = true,
                    show_unloaded = true,
                }
            }
        }
    end
}

local lualine_config = {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    keys = {
        {
            "<leader>j",
            function() vim.cmd("LualineBuffersJump! " .. vim.v.count) end,
            desc = "jump to buffer"
        }
    },
    config = function()
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                ignore_focus = { "neo-tree", "neo-tree-popup" },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    {
                        "filetype",
                        icon_only = true,
                        separator = ""
                    },
                    { "filename", padding = { left = 0, right = 1 } },
                    "diagnostics"
                },
                lualine_c = {},
                lualine_x = {
                    {
                        "buffers",
                        icons_enabled = false,
                        show_modified_status = false,
                        mode = 2,
                        symbols = { alternate_file = "" }
                    }, },
                lualine_y = { "searchcount", "location", "diff" },
                lualine_z = { "branch" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}

local indent_blankline_config = {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        vim.opt.list = true
        require("indent_blankline").setup()
    end
}

return {
    neotree_config,
    lualine_config,
    indent_blankline_config,
    { "shaunsingh/nord.nvim", init = function() vim.cmd.colorscheme("nord") end },
}
