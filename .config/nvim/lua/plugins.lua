-- Packer

return require('packer').startup(function()

    use "wbthomason/packer.nvim"
    use "ggandor/lightspeed.nvim"

    -- Telescope
    use {"nvim-lua/plenary.nvim", module_pattern = "plenary"}
    use {"kyazdani42/nvim-web-devicons", module_pattern = "devicons"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
        module_pattern = "telescope",
        cmd = "Telescope",
        -- If I for some reason don't use the nightly build
        --commit = "80cdb00",
        --lock = true,
    }

end)
