-- Plugins:
--   Vim_repeat   - allows for repeating plugin commands with .
--   Which_key    - hotkey guide
--   Auto_session - automatically restore sessions when running `nvim` command only

local which_key_config = {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup()
    end
}

local auto_session_config = {
    "rmagatti/auto-session",
    config = function() require("auto-session").setup {} end
}

return {
    which_key_config,
    auto_session_config,
    "tpope/vim-repeat",
}
