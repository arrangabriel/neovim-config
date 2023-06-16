require("utils")

CreateKeymap("n", "<SPACE>", "<Nop>")
SetVariable("mapleader", " ")

SetOption("clipboard", "unnamedplus")

SetOption("relativenumber", true)
SetOption("number", true)

SetOption("tabstop", 4)
SetOption("shiftwidth", 4)
SetOption("expandtab", true)

SetVariable("laststatus", 3)
SetVariable("loaded_netrw", 1)
SetVariable("loaded_netrwPlugin", 1)


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

SetVariable("neo_tree_remove_legacy_commands", 1)
