local utils = require("utils")

-- Easier split navigation
utils.map("n", "<C-h>", "<C-w><C-h>")
utils.map("n", "<C-l>", "<C-w><C-l>")
utils.map("n", "<C-j>", "<C-w><C-j>")
utils.map("n", "<C-k>", "<C-w><C-k>")

-- Esc to stop search
utils.map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Center when searching
utils.map("n", "n", "nzz")
utils.map("n", "N", "Nzz")
utils.map("n", "*", "*zz")
utils.map("n", "#", "#zz")
utils.map("n", "g*", "g*zz")
utils.map("n", "g#", "g#zz")

-- Stay in visual mode after (un)indenting
utils.map("v", ">", ">gv")
utils.map("v", "<", "<gv")

-- Keep register contents when paste-replacing
utils.map("x", "p", [["_dP]])

-- Make wrapped lines behave more naturally
utils.map({ "n", "x" }, "k", "gk")
utils.map({ "n", "x" }, "j", "gj")

-- Move to start and end of line
-- NOTE: might want to change these to 0 and $, currently whitespace is ignored
utils.map({ "n", "o", "x" }, "H", "^")
utils.map({ "n", "o", "x" }, "L", "g_")

-- Diagnostic navigation
utils.map("n", ">d", vim.diagnostic.goto_next, { desc = "Next [d]iagnostic" })
utils.map("n", "<d", vim.diagnostic.goto_prev, { desc = "Prev [d]iagnostic" })
utils.map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror" })
