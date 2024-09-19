--kanagawa

return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
      local theme = colors.theme
      return {
	-- telescope
	TelescopeTitle = { fg = theme.ui.special, bold = true },
	TelescopePromptNormal = { bg = theme.ui.bg_p1 },
	TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
	TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
	TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
	TelescopePreviewNormal = { bg = theme.ui.bg_dim },
	TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
	-- floating windows(lazy)
	NormalFloat = { bg = theme.ui.bg_m1 },
	FloatBorder = { bg = theme.ui.bg_m1 },
	FloatTitle = { bg = theme.ui.bg_m1 },
	-- statusline
	StatusLine = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
	Block = { fg = theme.ui.fg, bg = theme.ui.bg_m3 },
      }
    end,
    theme = "dragon",
    background = {
      dark = "dragon",
      light = "lotus"
    },
  },
}
