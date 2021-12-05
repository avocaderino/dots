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

-------------------
-- Inbuilt Plugins
-------------------
g.loaded_spellfile_plugin = 0   -- I know to spell
g.loaded_python_provider = 0    -- python2 is deprecated anyway
g.loaded_perl_provider = 0      -- perl
g.loaded_ruby_provider = 0      -- ruby
g.loaded_node_provider = 0      -- the infamous node
g.python3_host_prog = "/usr/bin/python3"
g.python_host_prog = ''
g.loaded_tutor_mode_plugin = 1

-------------------
-- Options
-------------------
o.showcmd = true        -- show command
o.showmode = false      -- we have a statusline ffs
o.autoread = false      -- I kinda ❤ that prompt
o.ruler = false         -- ruler
o.wildmenu = true       -- wildmenu
o.wildmode = "list:longest"
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
o.foldmethod = "marker"
o.shiftwidth = 4        -- indentation
o.tabstop = 4
o.expandtab = true
o.backup = false        -- no backups
o.undofile = true       -- prevent fuckups
o.undoreload = 10000
o.history = 50          -- command history
o.ignorecase = true     -- search
o.smartcase = true
o.incsearch = true      -- highlight searches
o.showmatch = false     -- jump brackets (why?)
o.number = false        -- add numbers
o.scrolloff = 10        -- scrolloff
o.cursorline = false    -- highlight cursor row
o.cursorcolumn = false  -- & column
o.laststatus = 2        -- always enable statusline
o.spell = false         -- ffs, I know how to spell

-- }}}
