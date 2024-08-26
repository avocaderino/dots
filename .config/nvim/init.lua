-- Init

-- core
require "core.options"
require "core.keymaps"
require "core.statusline"

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
  require "plugins.colors.kanagawa",
  require "plugins.treesitter",
  require "plugins.telescope",
  require "plugins.autopairs",
  require "plugins.lightspeed",
  require "plugins.vim-sleuth",
})
