-- config

local o = vim.opt
local g = vim.g

-- Plugins {{{

--g.did_load_filetypes       = 0
g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_vimball           = 1
g.loaded_tarPlugin         = 1
g.loaded_zipPlugin         = 1
g.loaded_vimballPlugin     = 1
g.loaded_2html_plugin      = 1
g.loaded_matchit           = 1
g.loaded_spec              = 1
g.loaded_remote_plugins    = 1
g.loaded_rrhelper          = 1
g.loaded_getscript         = 1
g.loaded_getscriptPlugin   = 1
g.loaded_tutor_mode_plugin = 1
-- language
g.loaded_python_provider  = 0   -- python2 is deprecated anyway
g.loaded_perl_provider    = 0   -- perl
g.loaded_ruby_provider    = 0   -- ruby
g.loaded_node_provider    = 0   -- the infamous node
g.python3_host_prog       = "/bin/python3"
g.loaded_spellfile_plugin = 1   -- technically a language plugin

-- }}}

-- Interface {{{

g.netrw_liststyle   = 3       -- tree view
o.showcmd           = true    -- show command
o.history           = 50      -- command history
o.showmode          = false   -- we have a statusline ffs
o.ruler             = false   -- long live democracy
o.wildmenu          = true    -- wildmenu
o.wildmode          = "longest,list"
o.wildignore        = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.xlsx,*.pptx"
o.laststatus        = 2       -- always show statusline

-- }}}

-- Editor {{{

o.clipboard     = "unnamedplus"
--o.shiftwidth    = 4         -- indentation
--o.tabstop       = 4
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

o.updatetime    = 100
o.backup        = false   -- living on the edge
o.undofile      = true    -- prevent fuckups
o.undolevels    = 1000
o.undoreload    = 10000
o.autoread      = false   -- I kinda ❤ that prompt

-- }}}
