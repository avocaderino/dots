-- Theme

-- Enable true colors
vim.opt.termguicolors = true

-- I don't need it for some stupid reason
--vim.cmd 'syntax on'

-- Set colorsheme
require 'colors.tomorrow-night'

-- Highlight groups
vim.cmd [[

hi Search                    guifg = None     guibg = #282a2e
hi IncSearch                 guifg = None     guibg = #373b41
hi MatchParen                guifg = None     guibg = #282a2e

" Statusline
hi Edge                      guifg = #1c1c1c  guibg = #848a8a
hi Inter                     guifg = #c5c8c6  guibg = #2a2b2e
hi Block                     guifg = #c5c8c6  guibg = #373b41

" lightspeed.nvim
hi LightspeedLabel           guifg = #cc6666                   gui = bold,underline
hi LightspeedLabelOverlapped guifg = #a3685a                   gui = bold,underline
hi LightspeedLabelDistant    guifg = #8abeb7                   gui = bold,underline
hi LightspeedShortcut        guifg = #ffffff  guibg = #cc6666  gui = bold,underline
hi LightspeedOneCharMatch    guifg = #ffffff  guibg = #cc6666  gui = bold
hi LightspeedPendingOpArea   guifg = #ffffff  guibg = #cc6666 

]]

if (os.getenv("ALACRITTY_LOG")) then
  require 'colors.tomorrow'
  vim.cmd [[
  hi LineNr                    guifg = #8e908c  guibg = None
  hi Edge                      guifg = #ffffff  guibg = #afbec5
  hi Inter                     guifg = #4d4d4c  guibg = #edeff1
  hi link Block Inter
  "lightspeed.nvim
  hi LightspeedUnlabeledMatch  guifg = #4d4d4c                   gui = bold
  hi LightspeedLabel           guifg = #cc6666                   gui = bold,underline
  hi LightspeedLabelOverlapped guifg = #a3685a                   gui = bold,underline
  hi LightspeedLabelDistant    guifg = #8abeb7                   gui = bold,underline
  hi LightspeedShortcut        guifg = #ffffff  guibg = #cc6666  gui = bold,underline
  hi LightspeedOneCharMatch    guifg = #ffffff  guibg = #cc6666  gui = bold
  hi LightspeedPendingOpArea   guifg = #ffffff  guibg = #cc6666 
  ]]
end
