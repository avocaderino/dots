-- Status Line

local api = vim.api

local widths = {
  mode  = 70,
--  ftype = 60,
--  pos   = 70,
}

local function truncate(width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

local modes = setmetatable({
  ["n"]  = {"Normal",    "N"};
  ["no"] = {"N·Pending", "N·P"};
  ["v"]  = {"Visual",    "V"};
  ["V"]  = {"V·Line",    "V·L"};
  [""] = {"V·Block",   "V·B"}; -- this is not ^V but 
  ["s"]  = {"Select",    "S"};
  ["S"]  = {"S·Line",    "S·L"};
  [""] = {"S·Block",   "S·B"}; -- not ^S but , get it?
  ["i"]  = {"Insert",    "I"};
  ["ic"] = {"Insert",    "I"};
  ["R"]  = {"Replace",   "R"};
  ["Rv"] = {"V·Replace", "V·R"};
  ["c"]  = {"Command",   "C"};
  ["cv"] = {"Vim·Ex",    "V·E"};
  ["ce"] = {"Ex",        "E"};
  ["r"]  = {"Prompt",    "P"};
  ["rm"] = {"More",      "M"};
  ["r?"] = {"Confirm",   "C"};
  ["t"]  = {"Terminal",  "T"};
  ["nt"] = {"Terminal",   "T"};
}, {
  __index = function()
    return {"Unkown", "U"}
  end
})

local function mode()
  local current_mode = api.nvim_get_mode().mode
  if truncate(widths.mode) then
    return string.format(" %s ", modes[current_mode][2]):upper()
  end
  return string.format(" %s ", modes[current_mode][1]):upper()
end

local function filename()
  -- Beautiful
  local filepath = api.nvim_buf_get_name(0):match("[^/]+$")
  if not filepath then
    filepath = vim.bo.filetype:match(".+") or "Untitled"
  end
  return string.format(" %%<%.30s ", filepath)
end

local function readonly()
  if vim.bo.readonly then return " " end
  return ""
end

local function modified()
  if vim.bo.modified then return "+" end
  return ""
end

-- icons {{{

local icons = {
  awk             = "",
  bash            = "",
  bib             = "",
  bzl             = "", --
  c               = "",
  checkhealth     = "",
  clojure         = "",
  cmake           = "", --
  cobol           = "", --
  conf            = "",
  cpp             = "",
  csh             = "",
  cs              = "", --
  css             = "",
  d               = "",
  dart            = "",
  db              = "",
  diff            = "",
  dockerfile      = "", --
  elm             = "",
  erlang          = "",
  fish            = "",
  fortran         = "F",
  fsharp          = "",
  git             = "",
  gitcommit       = "",
  go              = "",
  haskell         = "",
  html            = "",
  java            = "",
  javascript      = "",
  json            = "",
  julia           = "",
  kotlin          = "", --
  ksh             = "",
  less            = "",
  lhaskell        = "",
  lisp            = "λ",
  lua             = "",
  markdown        = "",
  matlab          = "", --
  meson           = "", --
  netrw           = "󰉋",
  nginx           = "",
  nix             = "",
  ocaml           = "", --
  packer          = "",
  perl            = "",
  php             = "",
  plaintex        = "",
  postscr         = "",
  prolog          = "",
  ps1             = "",
  puppet          = "",
  python          = "",
  javascriptreact = "",
  rmd             = "",
  ruby            = "",
  rust            = "",
  sass            = "",
  scala           = "",
  scheme          = "λ",
  scss            = "",
  sh              = "",
  sql             = "",
  svg             = "",
  swift           = "",
  tex             = "",
  text            = "",
  twig            = "",
  typescript      = "",
  vim             = "",
  vue             = "",
  xml             = "",
  yaml            = "",
  zsh             = "",
}

-- }}}

local function filetype()
  local ftype = vim.bo.filetype
  local icon = icons[ftype]
  if not icon then
    icon = "" -- default
  end
--  if truncate(widths.ftype) then
--    return string.format(" %s", icon)
--  end
--  return string.format("  %s %s  ", icon, ftype)
  return string.format("  %s", icon)
end

local function pos()
--  if truncate(widths.pos) then return "%2l:%-2c" end
  return " %3l:%-2c "
end

function statusline()
  -- powaaaah
  return table.concat{
    "%#Block#",
    mode(),
    "%#StatusLine#",
    filetype(),
    filename(),
    readonly(),
    modified(),
    "%=",
    pos(),
    "%#Block# ",
  }
end

-- set statusline
vim.opt.statusline = "%{%v:lua.statusline()%}"
