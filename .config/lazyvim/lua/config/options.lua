-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--vim.loader.enable() -- experimental lua loader?, lazy.nvim does it anyway

-- interface {{{

--vim.g.netrw_liststyle   = 3       -- tree view
vim.opt.showcmd = true -- show command
vim.opt.history = 50 -- command history
vim.opt.showmode = false -- we have a statusline ffs
vim.opt.ruler = false -- long live democracy
vim.opt.wildmenu = true -- wildmenu
vim.opt.wildmode = "longest,list"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.xlsx,*.pptx"
vim.opt.laststatus = 2 -- always show statusline

-- }}}

-- editor {{{

vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4 -- indentation
vim.opt.tabstop = 4
vim.opt.expandtab = true -- maintain peace
vim.opt.foldmethod = "marker" -- gotta deal with kitty.conf
vim.opt.ignorecase = true -- search
vim.opt.smartcase = true
vim.opt.incsearch = true -- highlight searches
vim.opt.showmatch = false -- jump brackets (why?)
vim.opt.number = true -- noadd numbers
vim.opt.relativenumber = true
vim.opt.scrolloff = 10 -- scrolloff
vim.opt.cursorline = true -- highlight cursor row
vim.opt.cursorcolumn = false -- & column
vim.opt.spell = false -- ffs, I know how to spell

-- }}}

-- file {{{

vim.opt.updatetime = 100
vim.opt.backup = false -- living on the edge
vim.opt.undofile = true -- prevent fuckups
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.autoread = false -- I kinda ❤ that prompt
vim.g.autoformat = false -- i hate it

-- }}}

-- statusline
require "config.statusline"
