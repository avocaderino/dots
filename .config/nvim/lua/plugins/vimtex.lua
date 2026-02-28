-- latex

return {
  "lervag/vimtex",
  lazy=false,
  --ft = "tex",
  init = function()
    vim.g.vimtex_view_method = "zathura"
    --vim.o.conceallevel = 2
  end
}
