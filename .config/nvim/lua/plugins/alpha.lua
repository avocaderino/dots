-- dashboard

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    -- Set header

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button( "e", "   New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "f", "   Find file", ":Telescope find_files<CR>"),
      dashboard.button( "r", "󰈢   Recent"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "c", "   Config"   , ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
      dashboard.button( "q", "󰅚   Quit NVIM", ":qa<CR>"),
    }
    -- Set footer
    local fortune = require("alpha.fortune") 
    dashboard.section.footer.val = fortune()

    return dashboard
  end,
  
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
  end,
}
