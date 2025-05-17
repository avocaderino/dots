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
  return string.format(" %s ", modes[current_mode][2]):upper()
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


local function filetype()
  local ftype = vim.bo.filetype
  local icon, hl, is_default = MiniIcons.get('filetype', ftype)
  return string.format("  %s ", icon)
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
    pos(),
    "%#Block#",
    " ",
  })
end

-- set statusline
vim.opt.statusline = "%{%v:lua.Statusline()%}"
