-- Packer

return require("packer").startup(function()

  -- packer
  use "wbthomason/packer.nvim"

  -- movement
  use "ggandor/lightspeed.nvim"

  -- icons
  use {"kyazdani42/nvim-web-devicons", module = "nvim-web-devicons"}

  -- telscope.nvim
  use {
    {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "telescope-file-browser.nvim",
        "telescope-fzf-native.nvim"
      },
      module = "telescope", cmd = "Telescope",
      config = [[require "modules.telescope"]]
    },
    {
      "nvim-lua/plenary.nvim",
      module = "plenary"
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }
  }

end)
