-- Status Line

-- Prep {{{

local fn = vim.fn
local api = vim.api

-- highlight groups
local colors = {
    active       = "%#StatusLine#",
    inactive     = "%#StatusLineNC#",
    mode         = "%#Edge#",
    filename     = "%#Inter#",
    readonly     = "%#Inter#",
    modified     = "%#Inter#",
    filetype     = "%#Block#",
    encoding     = "%#Block#",
    line_col     = "%#Edge#",
}

local trunc_width = {
    mode       = 70,
    filetype   = 60,
    encoding   = 70,
    line_col   = 70,
}


local is_truncated = function(width)
    local win = vim.g.statusline_winid
    local current_width = api.nvim_win_get_width(win)
    if current_width ~= "" then
    	return current_width < width
    end
end

-- }}}

-- Modes {{{

local modes = {
    ["n"]  = {"Normal", "N"};
    ["no"] = {"N·Pending", "N·P"} ;
    ["v"]  = {"Visual", "V" };
    ["V"]  = {"V·Line", "V·L" };
    [""] = {"V·Block", "V·B"};
    ["s"]  = {"Select", "S"};
    ["S"]  = {"S·Line", "S·L"};
    [""] = {"S·Block", "S·B"};
    ["i"]  = {"Insert", "I"};
    ["ic"] = {"Insert", "I"};
    ["R"]  = {"Replace", "R"};
    ["Rv"] = {"V·Replace", "V·R"};
    ["c"]  = {"Command", "C"};
    ["cv"] = {"Vim·Ex ", "V·E"};
    ["ce"] = {"Ex ", "E"};
    ["r"]  = {"Prompt ", "P"};
    ["rm"] = {"More ", "M"};
    ["r?"] = {"Confirm ", "C"};
    ["!"]  = {"Shell ", "S"};
    ["t"]  = {"Terminal ", "T"};
}

local get_current_mode = function()
    local current_mode = api.nvim_get_mode().mode

    if is_truncated(trunc_width.mode) then
        return string.format(" %s ", modes[current_mode][2]):upper()
    end
    return string.format(" %s ", modes[current_mode][1]):upper()
end

-- }}}

-- File {{{

local get_filename = function(buf)
    local filepath = api.nvim_buf_get_name(buf)
    -- Beautiful
    return string.format(" %%<%s ", filepath:match "[^/]*$")
end

local get_readonly = function(buf)
    local readonly = api.nvim_buf_get_option(buf, "readonly")
    if readonly then return " " end
    return ""
end

local get_modified = function()
    if vim.bo.modified then return "+" end
    return ""
end

local get_filetype = function(buf)
    local filetype = api.nvim_buf_get_option(buf,"filetype")
    local icon = require "utils".icons.lookup_filetype(filetype)

    if is_truncated(trunc_width.filetype) then
        return string.format(" %s ", icon)
    end
    return string.format("  %s %s ", icon, filetype):lower()
end

local get_encoding = function()
    local encoding = vim.bo.fileencoding
    if encoding == "" or is_truncated(trunc_width.encoding) then return " " end
    return string.format("| %s  ", encoding):lower()
end

local get_line_col = function()
    if is_truncated(trunc_width.line_col) then return " %l:%c " end
    return " %-8(row: %l%) %-7(col: %c%) "
end

-- }}}

-- Setting the actual status line {{{

statusline = function()
    local win_id = vim.g.statusline_winid
    local buf = api.nvim_win_get_buf(win_id)
    --elements
    local mode = colors.mode .. get_current_mode()
    local filename = colors.filename .. get_filename(buf)
    local readonly = colors.readonly .. get_readonly(buf)
    local modified = colors.modified .. get_modified()
    local filetype = colors.filetype .. get_filetype(buf)
    local encoding = colors.encoding .. get_encoding()
    local line_col = colors.line_col .. get_line_col()

    return table.concat({
        mode,
        filename,
        readonly,
        modified,
        "%=",
        filetype,
        encoding,
        line_col,
    })
end

-- set statusline
-- TODO: replace this once we can set it using lua
vim.cmd([[
    set statusline=%!v:lua.statusline()
]])

-- }}}

