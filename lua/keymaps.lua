local utils = require("utils")

-- Esc to stop search
utils.map_silent("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Center when searching
utils.map_silent("n", "n", "nzz")
utils.map_silent("n", "N", "Nzz")
utils.map_silent("n", "*", "*zz")

-- Stay in visual mode after (un)indenting
utils.map("v", ">", ">gv")
utils.map("v", "<", "<gv")

-- Keep register contents when paste-replacing
utils.map("x", "p", [["_dP]])

-- Make wrapped lines behave more naturally
utils.map_silent({ "n", "x" }, "k", "gk")
utils.map_silent({ "n", "x" }, "j", "gj")

-- Move to start and end of line
-- NOTE: might want to change these to 0 and $, currently whitespace is ignored
utils.map_silent({ "n", "o", "x" }, "H", "0")
utils.map_silent({ "n", "o", "x" }, "L", "$")

-- Diagnostic navigation
utils.map("n", "æd", vim.diagnostic.goto_next, { desc = "Next [d]iagnostic" })
utils.map("n", "ød", vim.diagnostic.goto_prev, { desc = "Prev [d]iagnostic" })
utils.map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror" })

vim.keymap.del("n", "[d")
vim.keymap.del("n", "]d")
