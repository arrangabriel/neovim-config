return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end
        },
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local telescope = require('telescope')

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-h>'] = "which_key",
                    },
                    n = {
                        ['<C-h>'] = "which_key",
                    }
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            }
        }

        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'By [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

        vim.keymap.set(
            'n',
            '<leader>/',
            function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            { desc = '[/] Fuzzily search in current buffer' }
        )

        vim.keymap.set(
            'n',
            '<leader>sn',
            function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end,
            { desc = '[N]eovim files' }
        )
    end,
}
