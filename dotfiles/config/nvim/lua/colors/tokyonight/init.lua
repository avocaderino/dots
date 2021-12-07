local util = require("colors.tokyonight.util")
local theme = require("colors.tokyonight.theme")

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true

util.load(theme.setup())
