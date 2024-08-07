-- telescope

return {

  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
        require("telescope").load_extension("file_browser")
      end
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      config = function()
        require("telescope").load_extension("fzf")
      end,
      build = "make",
      cond = function()
        return vim.fn.executable 'make' == 1
      end
    }
},

  opts = {
    defaults = {
      layout_strategy = "flex",
      layout_config = {
        width = 0.95,
        height = 0.95,
        preview_cutoff = 25,
        vertical = { preview_height = 0.20 }
      },
      dynamic_preview_title = true,
      history = false
    }
  }

}
