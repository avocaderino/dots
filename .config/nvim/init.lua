-- Init

require "theme"         -- lua/theme.lua
require "statusline"    -- lua/statusline.lua
require "maps"          -- lua/maps.lua
require "plugins"       -- lua/plugins.lua


-- {{{ Settings

local o = vim.opt    -- pretty versatile
local g = vim.g      -- global

-- failsafe
vim.cmd([[
    filetype on
    filetype plugin on
    filetype indent on
]])

-- Inbuilt Plugins
g.loaded_gzip         = 1
g.loaded_tar          = 1
g.loaded_tarPlugin    = 1
g.loaded_zipPlugin    = 1
g.loaded_2html_plugin = 1
g.loaded_matchit      = 1
g.loaded_spec         = 1
g.loaded_spellfile_plugin = 1

g.loaded_python_provider = 0    -- python2 is deprecated anyway
g.loaded_perl_provider = 0      -- perl
g.loaded_ruby_provider = 0      -- ruby
g.loaded_node_provider = 0      -- the infamous node
g.python3_host_prog = "/usr/bin/python3"
g.python_host_prog = ''
g.loaded_tutor_mode_plugin = 1

-- Interface
g.netrw_liststyle = 3   -- tree view
o.showcmd = true        -- show command
o.history = 50          -- command history
o.showmode = false      -- we have a statusline ffs
o.ruler = false         -- ruler
o.wildmenu = true       -- wildmenu
o.wildmode = "list:longest"
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
o.laststatus = 2        -- always enable statusline

-- Editor
o.shiftwidth = 4        -- indentation
o.tabstop = 4
o.expandtab = true
o.foldmethod = "marker"
o.ignorecase = true     -- search
o.smartcase = true
o.incsearch = true      -- highlight searches
o.showmatch = false     -- jump brackets (why?)
o.number = false        -- noadd numbers
o.scrolloff = 10        -- scrolloff
o.cursorline = false    -- highlight cursor row
o.cursorcolumn = false  -- & column
o.spell = false         -- ffs, I know how to spell

-- File
o.backup = false        -- no backups
o.undofile = true       -- prevent fuckups
o.autoread = false      -- I kinda ❤ that prompt
o.undoreload = 10000

-- }}}

