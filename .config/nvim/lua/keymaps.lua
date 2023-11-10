-- Keymaps

vim.g.mapleader = " "
-- map helper
local map = vim.keymap.set

-- qol {{{
map("n", "<leader><space>", "``")    -- jump to last cursor position
map("i", "jj", "<esc>")              -- exit insert mode
map("n", "Y", "y$")                  -- yank to eol
map("n", "P", "$p")                  -- pasta at eol
map("n", "n", "nzz")                 -- centre movin' up
map("n", "N", "Nzz")                 -- and down, like a roller coastah
map("n", "o", "o<esc>")              -- why go into insert mode
map("n", "O", "O<esc>")              -- when i just want to add lines
map("v", "<", "<gv")                 -- ffs,
map("v", ">", ">gv")                 -- why is this not default behaviour
--}}}

-- vscode? {{{
map("n", "<leader>kx", "<cmd>%s/\\s\\+$//e<cr>", { silent = true })  -- trim
map("n", "<leader>h", ":%s:::cg<left><left><left><left>") -- find and replace
map("n", "<esc>", "<cmd>noh | echo<cr><Esc>")             -- clear cmdline
-- }}}

-- move lines {{{
map("n", "<a-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<a-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- }}}

-- lazy {{{
map("n", "<leader>l", "<cmd>Lazy<cr>")
-- }}}

-- telescope {{{
map("n", "<leader>et","<cmd>Telescope<cr>")
map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<leader>b", "<cmd>Telescope buffers<cr>")
map("n", "<leader>t", "<cmd>Telescope file_browser<cr>")
-- }}}
