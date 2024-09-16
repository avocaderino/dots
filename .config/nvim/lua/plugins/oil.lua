-- oil.nvim

return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      -- Set to true to watch the filesystem for changes and reload oil
      watch_for_changes = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 3,
        max_width = 0,
        max_height = 0,
        border = "solid",
        win_options = {
          winblend = 0,
        },
      },
    })
  end,
}
