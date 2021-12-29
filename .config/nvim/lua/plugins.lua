-- Packer

return require("packer").startup(function()

    -- plugin manager
    use "wbthomason/packer.nvim"

    -- movement
    use "ggandor/lightspeed.nvim"

    use "nvim-lualine/lualine.nvim"

    -- telescope
    use {
        -- telescope.nvim
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
            },
            module = "telescope", cmd = "Telescope"
        },
        -- plenary.nvim
        {
            "nvim-lua/plenary.nvim",
            module = "plenary"
        },
        -- colorful icons
        {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons"
        }
    }

end)

