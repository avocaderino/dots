-- oil.nvim

return {
  "stevearc/oil.nvim",
  dependencies = {
    "mini.icons",
  },
  cmd = "Oil",
  keys = {
    {
      "<leader>o", mode = {"n"},
      function() require("oil").open_float() end,
      desc = "Open oil.nvim"
    },
  },
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("oil")
      end
    end
  end,

  opts = {
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
  },
}
