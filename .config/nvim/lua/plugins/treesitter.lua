-- treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "html",
      "css",
      "markdown",
      "latex"
    },
  },
}
