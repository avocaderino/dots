-- telescope.nvim config
require "telescope".setup{
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_cutoff = 25,
            vertical = {preview_height = 0.20}
        }
    },
    pickers = {
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
    },
    extensions = {
        file_browser = {hidden = true}
    }
}

-- extensions
require "telescope".load_extension "fzf"
require "telescope".load_extension "file_browser"
