local utils = require("utils")

-- Easier split navigation
utils.map_silent("n", "<C-h>", "<C-w><C-h>")
utils.map_silent("n", "<C-l>", "<C-w><C-l>")
utils.map_silent("n", "<C-j>", "<C-w><C-j>")
utils.map_silent("n", "<C-k>", "<C-w><C-k>")

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
utils.map("n", ">d", vim.diagnostic.goto_next, { desc = "Next [d]iagnostic" })
utils.map("n", "<d", vim.diagnostic.goto_prev, { desc = "Prev [d]iagnostic" })
utils.map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror" })
