local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup{

  -- lightspeed
  "ggandor/lightspeed.nvim",

  -- tabstop and shiftwidth
  "tpope/vim-sleuth",

  -- telescope {{{
  {
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

  },
  -- }}}

  -- autopair {{{
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup{}
    end
  },
  -- }}}

}
