-- Misc
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

-- Copy and paste to system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Expand tabs to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Indent wrapped lines
vim.opt.breakindent = true

-- Save undo history to file
vim.opt.undofile = true

-- Better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Command chain timeout
vim.opt.timeoutlen = 400

-- Highlight faster
vim.opt.updatetime = 300

-- More natural splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Highlight current line
vim.opt.cursorline = true
