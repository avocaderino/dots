-- telescope

return {

  "nvim-telescope/telescope.nvim",
  dependencies = {
    "plenary.nvim",
    "mini.icons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      config = function()
        require("telescope").load_extension("fzf")
      end,
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },

  cmd = "Telescope",
  keys = {
    {
      "<leader>bb",
      mode = { "n" },
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffer management",
    },
    {
      "<leader>st",
      mode = { "n" },
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Telescope pickers",
    },
    {
      "<c-f>",
      mode = { "n" },
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search string in cwd",
    },
  },

  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = "| ",
      layout_strategy = "flex",
      layout_config = {
        width = 0.95,
        height = 0.95,
        flip_columns = 25,
        prompt_position = "top",
      },
      dynamic_preview_title = true,
      history = false,
    },
  },
}
