-- Status Line

--local fn = vim.fn     -- Got rid of this piece of shit from my statusline finally
local api = vim.api

local trunc_width = {
    mode       = 70,
    filetype   = 60,
    encoding   = 60,
    line_col   = 70,
}

local is_truncated = function(width)
    local win = vim.g.statusline_winid
    local current_width = api.nvim_win_get_width(win)
    return current_width < width
end

local modes = {
    ["n"]  = {"Normal",     "N"};
    ["no"] = {"N·Pending",  "N·P"} ;
    ["v"]  = {"Visual",     "V" };
    ["V"]  = {"V·Line",     "V·L" };
    [""] = {"V·Block",    "V·B"};
    ["s"]  = {"Select",     "S"};
    ["S"]  = {"S·Line",     "S·L"};
    [""] = {"S·Block",    "S·B"};
    ["i"]  = {"Insert",     "I"};
    ["ic"] = {"Insert",     "I"};
    ["R"]  = {"Replace",    "R"};
    ["Rv"] = {"V·Replace",  "V·R"};
    ["c"]  = {"Command",    "C"};
    ["cv"] = {"Vim·Ex ",    "V·E"};
    ["ce"] = {"Ex ",        "E"};
    ["r"]  = {"Prompt ",    "P"};
    ["rm"] = {"More ",      "M"};
    ["r?"] = {"Confirm ",   "C"};
    ["!"]  = {"Shell ",     "S"};   -- why do I even have this here
    ["t"]  = {"Terminal ",  "T"};
}

local get_current_mode = function()
    local current_mode = api.nvim_get_mode().mode

    if is_truncated(trunc_width.mode) then
        return string.format("%%#Edge# %s ", modes[current_mode][2]):upper()
    end
    return string.format("%%#Edge# %s ", modes[current_mode][1]):upper()
end

local get_filename = function(buf)
    local filepath = api.nvim_buf_get_name(buf)
    -- Beautiful
    return string.format(" %%<%.30s ", filepath:match "[^/]+$" or "No Name")
end

local get_readonly = function(buf)
    if api.nvim_buf_get_option(buf, "readonly") then return " " end
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
    return string.format("  %s %s  ", icon, filetype)
end

local get_line_col = function()
    if is_truncated(trunc_width.line_col) then return " %l:%-c " end
    return " %2l:%-2c "
end

statusline = function()
    -- current buffer
    local buf = api.nvim_win_get_buf(vim.g.statusline_winid)
    -- powaaaah
    return table.concat({
        "%#Edge#",
        get_current_mode(),
        "%#Inter#",
        get_filename(buf),
        get_readonly(buf),
        get_modified(),
        "%=",
        "%#Block#",
        get_filetype(buf),
        "%#Edge#",
        get_line_col(),
    })
end

-- set statusline
vim.opt.statusline = "%!v:lua.statusline()"
