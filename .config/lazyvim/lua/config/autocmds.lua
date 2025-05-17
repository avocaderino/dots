-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- creating an augroup for your autocmds is good practice
vim.api.nvim_create_augroup("user", {})

-- disable line numbering in oil.nvim
vim.api.nvim_create_autocmd("Filetype", {
  group = "user",
  pattern = "oil",
  command = "setlocal nonumber norelativenumber",
})

-- hide cursorline when unfocused or telescope
vim.api.nvim_create_autocmd("WinEnter", {
  group = "user",
  command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd({"WinLeave", "Filetype"}, {
  group = "user",
  pattern = "Telescope*",
  command = "setlocal nocursorline",
})
