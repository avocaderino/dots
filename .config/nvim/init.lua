-- Init

require "theme"         -- lua/theme.lua
require "statusline"    -- lua/statusline.lua
require "plugins"       -- lua/plugins.lua

-- Settings

local o = vim.opt       -- pretty versatile
local g = vim.g         -- global

-- Inbuilt Plugins {{{

g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_zipPlugin         = 1
g.loaded_2html_plugin      = 1
g.loaded_matchit           = 1
g.loaded_spec              = 1
g.loaded_remote_plugins    = 1
g.loaded_tutor_mode_plugin = 1

-- }}}

-- Languages {{{

g.loaded_python_provider  = 0   -- python2 is deprecated anyway
g.loaded_perl_provider    = 0   -- perl
g.loaded_ruby_provider    = 0   -- ruby
g.loaded_node_provider    = 0   -- the infamous node
g.python3_host_prog       = "/bin/python3"
g.loaded_spellfile_plugin = 1   -- isn't this technically a language too

-- }}}

-- Interface {{{

g.netrw_liststyle   = 3         -- tree view
o.showcmd           = true      -- show command
o.history           = 50        -- command history
o.showmode          = false     -- we have a statusline ffs
o.ruler             = false     -- long live democracy
o.wildmenu          = true      -- wildmenu
o.wildmode          = "longest,list"
o.wildignore        = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.xlsx,*.pptx"
o.laststatus        = 2         -- always enable statusline

-- }}}

-- Editor {{{

o.shiftwidth    = 4         -- indentation
o.tabstop       = 4
o.expandtab     = true      -- maintain peace
o.foldmethod    = "marker"  -- gotta deal with kitty.conf
o.ignorecase    = true      -- search
o.smartcase     = true
o.incsearch     = true      -- highlight searches
o.showmatch     = false     -- jump brackets (why?)
o.number        = false     -- noadd numbers
o.scrolloff     = 10        -- scrolloff
o.cursorline    = false     -- highlight cursor row
o.cursorcolumn  = false     -- & column
o.spell         = false     -- ffs, I know how to spell

-- }}}

-- File {{{

o.backup        = false     -- livin' on the edge
o.undofile      = true      -- prevent fuckups
o.undolevels    = 1000
o.undoreload    = 10000
o.autoread      = false     -- I kinda ❤ that prompt

-- }}}

-- Mappings {{{

-- map helper
local map = vim.api.nvim_set_keymap

map("n", ",", "", {})      -- leader
g.mapleader = ","

options = { silent = true }

map("n", "<leader>,", "``", options)    -- jump to last cursor position
map("i", "jj", "<Esc>", options)        -- exit insert mode
map("n", "Y", "y$", options)            -- yank to eol
map("n", "P", "$P", options)            -- past at eol
map("n", "n", "nzz", options)           -- centre movin' up
map("n", "N", "Nzz", options)           -- and down, like a roller coastah
map("n", "<A-h>", "<C-w>h", options)    -- spl
map("n", "<A-j>", "<C-w>j", options)    -- it
map("n", "<A-k>", "<C-w>k", options)    -- wind
map("n", "<A-l>", "<C-w>l", options)    -- ows
map("n", "<leader>et", "<cmd>Telescope<CR>", options) -- Look into the stars
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", options) -- Files
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", options) -- Buffers
map("n", "<leader>t", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", options) -- File browser

-- }}}

-- "Scripts" {{{

if vim.bo.filetype == "lua" or "html" or "css" then
  o.shiftwidth = 2; o.tabstop = 2
end

-- }}}

