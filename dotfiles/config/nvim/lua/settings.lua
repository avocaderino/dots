-- Settings

local o = vim.opt    -- pretty versatile
local g = vim.g      -- global

HOME = os.getenv("HOME")

-- failsafe
vim.cmd([[

    filetype on
    filetype plugin on
    filetype indent on

]])

g.loaded_python_provider = 0
g.python_host_prog = ''

o.showcmd = true        -- show command
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
o.undodir = HOME .. "/.local/share/nvim/site/backup"
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
