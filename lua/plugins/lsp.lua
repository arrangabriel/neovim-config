local null_ls_config = {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup {
            sources = {
                null_ls.builtins.formatting.prettier,
                --null_ls.builtins.formatting.black
            }
        }
    end
}

local lsp_zero_config = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                  -- Required
        { 'hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'hrsh7th/cmp-buffer' },                -- Optional
        { 'hrsh7th/cmp-path' },                  -- Optional
        { 'saadparwaiz1/cmp_luasnip' },          -- Optional
        { 'hrsh7th/cmp-nvim-lua' },              -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
        local lsp = require('lsp-zero').preset {
            name = 'minimal',
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = true,
        }

        lsp.format_on_save {
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['lua_ls'] = { 'lua' },
                ['null-ls'] = { 'javascript', 'typescript' },
                ['pylsp'] = { 'python' },
            }
        }

        lsp.setup()

        vim.diagnostic.config {
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = false,
            float = true,
        }

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        }

        lspconfig.pylsp.setup {
            settings = {
                formatCommand = { "black" },
                pylsp = {
                    plugins = {
                        black = { enabled = true, line_length = 90 },
                        pycodestyle = {
                            enabled = true,
                            ignore = {
                                "E501",
                                "E231"
                            },
                            maxLineLength = 90
                        },
                    }
                }
            }
        }
    end
}

local nvim_treesitter_config = {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = {
                enable = true
            }
        }
    end
}

return {
    null_ls_config,
    lsp_zero_config,
    nvim_treesitter_config
}
