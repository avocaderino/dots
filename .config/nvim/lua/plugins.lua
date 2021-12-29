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
                "nvim-telescope/telescope-file-browser.nvim"
            },
            module = "telescope", cmd = "Telescope",
            config = [[require "modules.telescope"]]
        },

        -- plenary.nvim
        {"nvim-lua/plenary.nvim", module = "plenary"},

        -- colorful icons
        {"kyazdani42/nvim-web-devicons", module = "nvim-web-devicons"},

        -- file browser
        "nvim-telescope/telescope-file-browser.nvim",

        -- fuzzy finder
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    }

end)

