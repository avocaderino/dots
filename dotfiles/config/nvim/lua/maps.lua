-- Keybindings

-- map helper
local map = vim.api.nvim_set_keymap

map('n', ',', '', {})      -- leader
vim.g.mapleader = ""

options = { noremap = true }

map("n", "<leader>,", "``", options)     -- jump to last cursor position
map("i", "jj", "<Esc>", options)         -- exit insert mode
map("n", "<space>", ":", options)        -- command
map("n", "Y", "y$", options)             -- yank to eol
map("n", "P", "$P", options)             -- past at eol
map('n', 'n', 'nzz', options)            -- centre while movin' up
map('n', 'N', 'Nzz', options)            -- and down, like a roller coastah
map("n", "<A-h>", "<C-w>h", options)    -- spl
map("n", "<A-j>", "<C-w>j", options)    -- it
map("n", "<A-k>", "<C-w>k", options)    -- wind
map("n", "<A-l>", "<C-w>l", options)    -- ows
