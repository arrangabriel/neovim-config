local utils = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Esc to stop search
utils.map_silent("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Stay in visual mode after (un)indenting
utils.map("v", ">", ">gv")
utils.map("v", "<", "<gv")

-- Keep register contents when paste-replacing
utils.map("x", "p", [["_dP]])

-- Diagnostic navigation
utils.map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show [d]iagnostic" })

-- Prev/Next
utils.map({ "n", "v", "o" }, "ø", "[", { remap = true })
utils.map({ "n", "v", "o" }, "æ", "]", { remap = true })
