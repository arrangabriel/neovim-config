return {
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
                        icons_enabled = true,
                        show_modified_status = false,
                        mode = 2,
                        symbols = { alternate_file = "" }
                    },
                },
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
