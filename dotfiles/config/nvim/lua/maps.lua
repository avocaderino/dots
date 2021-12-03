-- Keybindings

-- map helper
local map = vim.api.nvim_set_keymap

map('n', ',', '', {})
vim.g.mapleader = ""       -- leader

options = { noremap = true }

map("n", "<leader>,", "``", options)     -- jump to last cursor position
map("i", "jj", "<Esc>", options)         -- exit insert mode
map("n", "<space>", ":", options)        -- command
map("n", "Y", "y$", options)             -- yank to eol
map("n", "P", "$P", options)             -- past at eol
map('n', 'n', 'nzz', options)            -- centre while movin' up
map('n', 'N', 'Nzz', options)            -- and down, like a roller coastah

