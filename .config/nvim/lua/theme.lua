-- Theme

-- Enable true colors
vim.o.termguicolors = true

-- Turn syntax highlighting on
vim.cmd("syntax on")

-- Set colorsheme
require "colors.base16-tomorrow-night"

-- Highlight groups
vim.cmd([[

hi Edge         guifg = #1c1c1c  guibg = #848a8a
hi Inter        guifg = #c5c8c6  guibg = #2a2b2e
hi Block        guifg = #c5c8c6  guibg = #373b41
hi Search       guifg = None     guibg = #282a2e
hi MatchParen   guifg = None     guibg = #282a2e
hi LineNr       guifg = #969896  guibg = None

]])
