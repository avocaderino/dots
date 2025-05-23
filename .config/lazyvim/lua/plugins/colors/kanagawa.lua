--kanagawa

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
      local theme = colors.theme
      return {
        -- floating windows(lazy)
        NormalFloat = { bg = theme.ui.bg_m1 },
        FloatBorder = { bg = theme.ui.bg_m1 },
        FloatTitle = { bg = theme.ui.bg_m1 },
        -- gutter
        LineNr = { bg = theme.ui.bg },
        -- diagnostics
        DiagnosticSignOk = { bg = theme.ui.bg },
        DiagnosticSignHint = { bg = theme.ui.bg },
        DiagnosticSignInfo = { bg = theme.ui.bg },
        DiagnosticSignWarn = { bg = theme.ui.bg },
        DiagnosticSignError = { bg = theme.ui.bg },
        -- statusline
        StatusLine = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
        Block = { fg = theme.ui.fg, bg = theme.ui.bg_m3 },
      }
    end,
    theme = "dragon",
    background = {
      dark = "dragon",
      light = "wave",
    },
  },
}
