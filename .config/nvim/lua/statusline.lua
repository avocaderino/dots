-- Status Line

local api = vim.api

local widths = {
  mode     = 70,
  filetype = 60,
  pos      = 70,
}

local function truncate(width)
  local current_width = api.nvim_win_get_width(vim.g.statusline_winid)
  return current_width < width
end

local modes = setmetatable({
  ['n']  = {'Normal',    'N'};
  ['no'] = {'N·Pending', 'N·P'};
  ['v']  = {'Visual',    'V'};
  ['V']  = {'V·Line',    'V·L'};
  [''] = {'V·Block',   'V·B'}; -- this is not ^V but 
  ['s']  = {'Select',    'S'};
  ['S']  = {'S·Line',    'S·L'};
  [''] = {'S·Block',   'S·B'}; -- not ^S but , get it?
  ['i']  = {'Insert',    'I'};
  ['ic'] = {'Insert',    'I'};
  ['R']  = {'Replace',   'R'};
  ['Rv'] = {'V·Replace', 'V·R'};
  ['c']  = {'Command',   'C'};
  ['cv'] = {'Vim·Ex',    'V·E'};
  ['ce'] = {'Ex',        'E'};
  ['r']  = {'Prompt',    'P'};
  ['rm'] = {'More',      'M'};
  ['r?'] = {'Confirm',   'C'};
  ['t']  = {'Terminal',  'T'};
  ['nt'] = {'Terminal',   'T'};
}, {
  __index = function()
    return {'Unkown', 'U'}
  end
})

local function mode()
  local current_mode = api.nvim_get_mode().mode
  if truncate(widths.mode) then
    return string.format('%%#Edge# %s ', modes[current_mode][2]):upper()
  end
  return string.format('%%#Edge# %s ', modes[current_mode][1]):upper()
end

local function filename(buf)
  local filepath = api.nvim_buf_get_name(buf)
  -- Beautiful
  return string.format(' %%<%.30s ', filepath:match '[^/]+$' or 'No Name')
end

local function readonly(buf)
  if api.nvim_buf_get_option(buf, 'readonly') then return ' ' end
  return ''
end

local function modified(buf)
  if api.nvim_buf_get_option(buf, 'modified') then return '+' end
  return ''
end

local function filetype(buf)
  local ftype = api.nvim_buf_get_option(buf,'filetype')
  local icon = require 'utils'.icons.lookup_filetype(ftype)
  if truncate(widths.filetype) then
    return string.format(' %s ', icon)
  end
  return string.format('  %s %s  ', icon, ftype)
end

local function pos()
  if truncate(widths.pos) then return ' %l:%-c ' end
  return ' %2l:%-2c '
end

statusline = function()
  -- current buffer
  local buf = api.nvim_win_get_buf(vim.g.statusline_winid)
  -- powaaaah
  return table.concat({
    '%#Edge#',
    mode(),
    '%#Inter#',
    filename(buf),
    readonly(buf),
    modified(buf),
    '%=',
    '%#Block#',
    filetype(buf),
    '%#Edge#',
    pos(),
  })
end

-- set statusline
vim.opt.statusline = '%!v:lua.statusline()'
