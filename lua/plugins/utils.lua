-- Plugins:
--   Vim_repeat - allows for repeating plugin commands with .
--   Which_key  - hotkey guide

local which_key_config = {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup()
    end
}

return {
    which_key_config,
    "tpope/vim-repeat",
}
