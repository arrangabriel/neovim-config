-- Misc
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

-- Expand tabs to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Highlight current line
vim.opt.cursorline = true

-- Highlight faster
vim.opt.updatetime = 300

vim.diagnostic.config({ virtual_text = true, signs = false })

-- Copy and paste to system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Save undo history to file
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Options for completion menu
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "popup", "noselect" }

-- Hide mode indicator
vim.opt.showmode = false

vim.opt.wrap = false
