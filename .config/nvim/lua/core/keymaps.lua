-- Keymaps

vim.g.mapleader = " "
-- map helper
local map = vim.keymap.set

-- qol {{{
map("n", "<leader><space>", "``", { noremap = true, silent = true, desc = "Jump to last mark" })
map("i", "jj", "<esc>", { noremap = true, silent = true, desc = "Exit Insert" })
map("n", "Y", "y$", { noremap = true, silent = true, desc = "Yank to EOL" })                 
map("n", "P", "$p", { noremap = true, silent = true, desc = "Paste at EOL" })                 
map("n", "n", "nzz", { noremap = true, silent = true, desc = "Center while moving through search results" })                
map("n", "N", "Nzz", { noremap = true, silent = true, desc = "Center while moving through search results" })                
map("n", "k", "gk", { noremap = true, silent = true, desc = "Better up" })                 
map("n", "j", "gj", { noremap = true, silent = true, desc = "Better down" })                 
map("v", "<", "<gv", { noremap = true, silent = true, desc = "De-indent block by 1 stop" })                
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent block by 1 stop" })                
--}}}

-- vscode? {{{
map("n", "<leader>kx", "<cmd>%s/\\s\\+$//e<cr>", { noremap = true, silent = true, desc = "Trim trailing whitespaces" })
map("v", "<leader>h", ":s:::cg<left><left><left><left>", { noremap = true, desc = "Search and replace in selection" })
map("n", "<leader>h", ":%s:::cg<left><left><left><left>", { noremap = true, desc = "Search and replace" })
map("n", "<esc>", "<cmd>noh | echo<cr><esc>", { noremap = true, desc = "Clear command line" })
-- }}}

-- move lines {{{
map("n", "<m-j>", "<cmd>m .+1<cr>==", { noremap = true, silent = true, desc = "Shift current line downwards" })
map("n", "<m-k>", "<cmd>m .-2<cr>==", { noremap = true, silent = true, desc = "Shift current line upwards" })
map("i", "<m-j>", "<esc><cmd>m .+1<cr>==gi", { noremap = true, silent = true, desc = "Shift current line downwards" })
map("i", "<m-k>", "<esc><cmd>m .-2<cr>==gi", { noremap = true, silent = true, desc = "Shift current line upwards" })
map("v", "<m-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Shift lines containing selection downwards" })
map("v", "<m-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Shift lines containing selection upwards" })
-- }}}

-- windows {{{
map("n", "<c-h>", "<c-w>h", { noremap = true, silent = true, desc = "Move window focus left" })   
map("n", "<c-j>", "<c-w>j", { noremap = true, silent = true, desc = "Move window focus down" })   
map("n", "<c-k>", "<c-w>k", { noremap = true, silent = true, desc = "Move window focus up" })   
map("n", "<c-l>", "<c-w>l", { noremap = true, silent = true, desc = "Move window focus right" })   
-- }}}

-- lazy {{{
map("n", "<leader>l", "<cmd>Lazy<cr>", { noremap = true, silent = true, desc = "Lazy" })
-- }}}
