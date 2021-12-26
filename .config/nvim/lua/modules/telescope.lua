require("telescope").setup {

    defaults = {
        -- Default configuration for telescope goes here:
        layout_strategy = "flex",

        layout_config = {
            width    = 0.95,
            height   = 0.95,
            vertical = { preview_cutoff = 20 }
        },

        file_ignore_patterns = {
            -- files
            "%.jpg", "%.jpeg", "%.png", "%.gif", "%.mkv", "%.docx", "%.pdf",
            "%.xlsx", "%.pptx", "%.iso", "%.db"
        },

        history = {"false"}
    },

    pickers = {
        -- Default configuration for builtin pickers goes here:
        file_browser = {
            hidden = true
        },

        find_files = {
            hidden = true,

            file_ignore_patterns = {
                -- files
                "%.jpg", "%.jpeg", "%.png", "%.gif", "%.mkv", "%.docx", "%.pdf",
                "%.xlsx", "%.pptx", "%.iso", "%.db",
                -- directories
                "^%.cache/", "[/]+Code/", "[/]*%.git/", "^%.local/", "^%.mozilla/",
                "^%.vscode/"
            }
        }
    },

    extensions = {
        -- Your extension configuration goes here:
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter    = true,
            case_mode = "smart_case"
        }
    }

}

-- Extensions
require("telescope").load_extension "fzf"
