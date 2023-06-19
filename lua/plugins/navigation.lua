-- Plugins:
--  Telescope - fuzzy finder
--  Leap      - prefix based jumping

local telescope_config = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files() end,
            desc = "Telescope find files"
        },
        {
            "<leader>fg",
            function() require("telescope.builtin").live_grep() end,
            desc = "Telescope live grep"
        },
        {
            "<leader>fp",
            function() require("telescope.builtin").builtin() end,
            desc = "Telescope find picker"
        },
        {
            "<leader>fh",
            function() require('telescope.builtin').help_tags() end,
            desc = "Telescope help tags"
        },
        {
            "<leader>fd",
            function() require('telescope.builtin').diagnostics() end,
            desc = "Telescope find lsp diagnostics"
        }
    },
    config = function()
        require("telescope").setup {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key",
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous"
                    }
                }
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        }
    end
}

local leap_config = {
    "ggandor/leap.nvim",
    config = function()
        require('leap').add_default_mappings(true)
    end
}

return {
    telescope_config,
    leap_config
}
