-- Keymaps

vim.g.mapleader = " "
-- map helper
local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- qol {{{
map("n", "<leader><space>", "``", opts)    -- jump to last cursor position
map("i", "jj", "<esc>", opts)              -- exit insert mode
map("n", "Y", "y$", opts)                  -- yank to eol
map("n", "P", "$p", opts)                  -- pasta at eol
map("n", "n", "nzz", opts)                 -- centre movin' up
map("n", "N", "Nzz", opts)                 -- and down, like a roller coastah
map("n", "k", "gk", opts)                  -- ffs,
map("n", "j", "gj", opts)                  -- why is this not default behaviour
map("v", "<", "<gv", opts)                 -- ffs,
map("v", ">", ">gv", opts)                 -- why is this not default behaviour
--}}}

-- vscode? {{{
map("n", "<leader>kx", "<cmd>%s/\\s\\+$//e<cr>", opts) -- trim trailing whitespaces
map("v", "<leader>h", ":s:::cg<left><left><left><left>", {noremap = true})
map("n", "<leader>h", ":%s:::cg<left><left><left><left>", {noremap = true})
map("n", "<esc>", "<cmd>noh | echo<cr><esc>", {noremap = true}) -- clear cmdline
-- }}}

-- move lines {{{
map("n", "<a-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<a-k>", "<cmd>m .-2<cr>==", opts)
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", opts)
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", opts)
map("v", "<a-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<a-k>", ":m '<-2<cr>gv=gv", opts)
-- }}}

-- windows {{{
map("n", "<c-h>", "<c-w>h", opts)    -- spl
map("n", "<c-j>", "<c-w>j", opts)    -- it
map("n", "<c-k>", "<c-w>k", opts)    -- wind
map("n", "<c-l>", "<c-w>l", opts)    -- ows
-- }}}

-- plugins

-- lazy {{{
map("n", "<leader>l", "<cmd>Lazy<cr>", opts)
-- }}}

-- telescope {{{
map("n", "<leader>et","<cmd>Telescope<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>t", "<cmd>Telescope file_browser<cr>", opts)
map("n", "<c-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
-- }}}
