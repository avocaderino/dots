-- statusline

--local widths = {
--  mode  = 70,
--  ftype = 60,
--  pos   = 70,
--}

--local function truncate(width)
--  local current_width = vim.api.nvim_win_get_width(0)
--  return current_width < width
--end

local modes = setmetatable({
  ["n"] = { "Normal", "N" },
  ["no"] = { "N·Pending", "N·P" },
  ["v"] = { "Visual", "V" },
  ["V"] = { "V·Line", "V·L" },
  [""] = { "V·Block", "V·B" }, -- this is not ^V but 
  ["s"] = { "Select", "S" },
  ["S"] = { "S·Line", "S·L" },
  [""] = { "S·Block", "S·B" }, -- not ^S but , get it?
  ["i"] = { "Insert", "I" },
  ["ic"] = { "Insert", "I" },
  ["R"] = { "Replace", "R" },
  ["Rv"] = { "V·Replace", "V·R" },
  ["c"] = { "Command", "C" },
  ["cv"] = { "Vim·Ex", "V·E" },
  ["ce"] = { "Ex", "E" },
  ["r"] = { "Prompt", "P" },
  ["rm"] = { "More", "M" },
  ["r?"] = { "Confirm", "C" },
  ["t"] = { "Terminal", "T" },
  ["nt"] = { "Terminal", "T" },
}, {
  __index = function()
    return { "Unkown", "U" }
  end,
})

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode][1]):upper()
end

local function filename()
  -- Beautiful
  local filepath = vim.api.nvim_buf_get_name(0):match("[^/]+$")
  if not filepath then
    filepath = vim.bo.filetype:match(".+") or "Untitled"
  end
  return string.format(" %%<%.30s ", filepath)
end

local function readonly()
  if vim.bo.readonly then
    return " "
  end
  return ""
end

local function modified()
  if vim.bo.modified then
    return "+"
  end
  return ""
end

-- icons {{{

local icons = {
  awk = "",
  bash = "",
  bib = "",
  bzl = "", --
  c = "",
  checkhealth = "",
  clojure = "",
  cmake = "", --
  cobol = "", --
  conf = "",
  cpp = "",
  csh = "",
  cs = "", --
  css = "",
  d = "",
  dart = "",
  db = "",
  diff = "",
  dockerfile = "", --
  elm = "",
  erlang = "",
  fish = "",
  fortran = "F",
  fsharp = "",
  git = "",
  gitcommit = "",
  go = "",
  haskell = "",
  html = "",
  java = "",
  javascript = "",
  json = "",
  julia = "",
  kotlin = "", --
  ksh = "",
  less = "",
  lhaskell = "",
  lisp = "λ",
  lua = "",
  markdown = "",
  matlab = "", --
  meson = "", --
  netrw = "󰉋",
  nginx = "",
  nix = "",
  ocaml = "", --
  packer = "",
  perl = "",
  php = "",
  plaintex = "",
  postscr = "",
  prolog = "",
  ps1 = "",
  puppet = "",
  python = "",
  javascriptreact = "",
  rmd = "",
  ruby = "",
  rust = "",
  sass = "",
  scala = "",
  scheme = "λ",
  scss = "",
  sh = "",
  sql = "",
  svg = "",
  swift = "",
  tex = "",
  text = "",
  twig = "",
  typescript = "",
  vim = "",
  vue = "",
  xml = "",
  yaml = "",
  zsh = "",
}

-- }}}

local function filetype()
  local ftype = vim.bo.filetype
  local icon = icons[ftype]
  if not icon then
    icon = "" -- default
  end
  return string.format("  %s", icon)
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat({
    " ",
    added,
    changed,
    removed,
    " ",
    "%#GitSignsAdd# ",
    git_info.head,
    " %#StatusLine#",
  })
end

local function pos()
  return " %P %2l:%-2c "
end

function Statusline()
  -- powaaaah
  return table.concat({
    "%#Block#",
    mode(),
    "%#StatusLine#",
    filetype(),
    filename(),
    readonly(),
    modified(),
    "%=",
    vcs(),
    pos(),
    "%#Block# ",
  })
end

-- set statusline
vim.opt.statusline = "%{%v:lua.Statusline()%}"
