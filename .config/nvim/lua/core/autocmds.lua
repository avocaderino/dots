-- autocmds

-- creating an augroup for your autocmds is good practice
vim.api.nvim_create_augroup("user", {})

-- disable line numbering in oil.nvim
vim.api.nvim_create_autocmd("Filetype", {
  group = "user",
  pattern = "oil",
  command = "setlocal nonumber",
})

-- hide cursorline when unfocused
vim.api.nvim_create_autocmd("WinEnter", {
  group = "user",
  command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "user",
  command = "setlocal nocursorline",
})
