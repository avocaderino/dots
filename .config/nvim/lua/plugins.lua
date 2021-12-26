-- Packer

return require('packer').startup(function()

    -- packer
    use "wbthomason/packer.nvim"

    -- movement
    use "ggandor/lightspeed.nvim"

    -- colorful icons
    use {
        "kyazdani42/nvim-web-devicons",
        module_pattern = "devicons"
    }

    -- search
    use {
        -- telescope.nvim
        {
            "nvim-telescope/telescope.nvim",
            requires = { 
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "telescope-fzf-native.nvim"
            },
            module = "telescope", cmd = "Telescope",
            config = [[require "modules.telescope"]]
        },
        -- plenary.nvim
        {
            "nvim-lua/plenary.nvim",
            module_pattern = "plenary"
        },
        -- fzf
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
        }
    }

end)

