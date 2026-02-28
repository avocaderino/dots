-- snippets

return {
  "L3MON4D3/LuaSnip",
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event = "VeryLazy",
  init = function()
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})
  end,
  opts = {
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI'
  },

  keys = {
    {
      "<tab>", mode = {"i"},
      function()
        if require("luasnip").expand_or_jumpable() then
          vim.schedule(function() require("luasnip").expand_or_jump() end)
          return true
        else return "<tab>" end
      end,
      desc = "expand or jump", silent = true, expr = true
    },
    {
      "<tab>", mode = {"s"},
      function() require("luasnip").jump(1) end,
      desc = "jump", silent = true
    },
    {
      "<s-tab>", mode = {"i","s"},
      function() require("luasnip").jump(-1) end,
      desc = "jump backwards", silent = true
    }
  }
}
