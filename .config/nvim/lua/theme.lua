-- Theme

-- Enable true colors
vim.opt.termguicolors = true

-- I don"t need it for some stupid reason
--vim.cmd "syntax on"

-- Set colorsheme
require "colors.tomorrow-night"

if os.getenv("ALACRITTY_LOG") then
  require "colors.tokyonight"
end
