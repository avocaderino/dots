-- set options

--vim.loader.enable() -- experimental lua loader?, lazy.nvim does it anyway

-- Plugins {{{

--vim.g.did_load_filetypes       = 0
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_spec              = 1
vim.g.loaded_remote_plugins    = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
-- language
vim.g.loaded_python_provider  = 0   -- python2 is deprecated anyway
vim.g.loaded_perl_provider    = 0   -- perl
vim.g.loaded_ruby_provider    = 0   -- ruby
vim.g.loaded_node_provider    = 0   -- the infamous node
vim.g.python3_host_prog       = "/bin/python3"
vim.g.loaded_spellfile_plugin = 1   -- technically a language plugin

-- }}}

-- Interface {{{

--vim.g.netrw_liststyle   = 3       -- tree view
vim.opt.showcmd           = true    -- show command
vim.opt.history           = 50      -- command history
vim.opt.showmode          = false   -- we have a statusline ffs
vim.opt.ruler             = false   -- long live democracy
vim.opt.wildmenu          = true    -- wildmenu
vim.opt.wildmode          = "longest,list"
vim.opt.wildignore        = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.xlsx,*.pptx"
vim.opt.laststatus        = 2       -- always show statusline

-- }}}

-- Editor {{{

vim.opt.clipboard      = "unnamedplus"
vim.opt.shiftwidth     = 4         -- indentation
vim.opt.tabstop        = 4
vim.opt.expandtab      = true      -- maintain peace
vim.opt.foldmethod     = "marker"  -- gotta deal with kitty.conf
vim.opt.ignorecase     = true      -- search
vim.opt.smartcase      = true
vim.opt.incsearch      = true      -- highlight searches
vim.opt.showmatch      = false     -- jump brackets (why?)
vim.opt.number         = true     
vim.opt.relativenumber = false     -- noadd numbers
vim.opt.scrolloff      = 10        -- scrolloff
vim.opt.cursorline     = true     -- highlight cursor row
vim.opt.cursorcolumn   = false     -- & column
vim.opt.spell          = false     -- ffs, I know how to spell

-- }}}

-- File {{{

vim.opt.updatetime     = 100
vim.opt.backup         = false   -- living on the edge
vim.opt.undofile       = true    -- prevent fuckups
vim.opt.undolevels     = 1000
vim.opt.undoreload     = 10000
vim.opt.autoread       = false   -- I kinda ❤ that prompt

-- }}}
