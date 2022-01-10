-- Packer

return require('packer').startup(function()

  -- packer
  use 'wbthomason/packer.nvim'

  -- motion
  use 'ggandor/lightspeed.nvim'

  -- file search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'plenary.nvim',
        'nvim-web-devicons',
        'telescope-file-browser.nvim',
        'telescope-fzf-native.nvim'
      },
      module = 'telescope', cmd = 'Telescope',
      config = [[require 'modules.telescope']]
    },
    {
      'nvim-lua/plenary.nvim',
      module = 'plenary'
    },
    {
      'kyazdani42/nvim-web-devicons',
      module = 'nvim-web-devicons'
    },
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }
  }

  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = [[require('nvim-autopairs').setup{}]]
  }

  -- which-key
--  use {
--    'folke/which-key.nvim',
--    config = [[require('which-key').setup{}]]
--  }

end)
