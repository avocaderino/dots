-- Status Line

local fn = vim.fn
local api = vim.api
local M = {}

-- highlight groups
M.colors = {
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

M.trunc_width = setmetatable({
    mode       = 80,
    filetype   = 70,
    encoding   = 60,
    line_col   = 80,
}, {
    __index = function()
        return 80 -- handle edge cases, if there"s any
    end
})

M.is_truncated = function(_, width)
    local current_width = api.nvim_win_get_width(0)
    return current_width < width
end

M.modes = setmetatable({
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
}, {
    __index = function()
        return {"Unknown", "U"} -- handle edge cases
    end
})

M.get_current_mode = function(self)
    local current_mode = api.nvim_get_mode().mode

    if self:is_truncated(self.trunc_width.mode) then
        return string.format(" %s ", M.modes[current_mode][2]):upper()
    end

    return string.format(" %s ", M.modes[current_mode][1]):upper()
end

M.get_filename = function()
    return " %<%t "
end

M.get_readonly = function()
    local readonly = api.nvim_buf_get_option(0, "readonly")
    if readonly then return "" end
    return ""
end

M.get_modified = function()
    if vim.bo.modified then return "+" end
    return ""
end

M.get_filetype = function(self)
    local file_name, filetype = api.nvim_buf_get_name(0), vim.bo.filetype
    local icon = require "modules.icons".get_icon(file_name, filetype, { default = true })

    if self:is_truncated(self.trunc_width.filetype) then
        return string.format(" %s ", icon) 
    end
    return string.format("  %s %s ", icon, filetype):lower()
end

M.get_encoding = function(self)
    local encoding = vim.bo.fileencoding
    if encoding == "" then return " "
    elseif self:is_truncated(self.trunc_width.encoding) then
        return ""
    end

    return string.format(" %s  ", encoding):lower()
end

M.get_line_col = function(self)
    if self:is_truncated(self.trunc_width.line_col) then return " %l:%c " end
    return " %-8(row: %l%) %-7(col: %c%) "
end

M.status_line = function(self)
    local colors = self.colors

    local mode = colors.mode .. self:get_current_mode()
    local filename = colors.filename .. self:get_filename()
    local readonly = colors.readonly .. self:get_readonly()
    local modified = colors.modified .. self:get_modified()
    local filetype = colors.filetype .. self:get_filetype()
    local encoding = colors.encoding .. self:get_encoding()
    local line_col = colors.line_col .. self:get_line_col()

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

function StatusLine()
    return M.status_line(M)   -- Feel the powaaaahhh
end

-- set statusline
-- TODO(elianiva): replace this once we can define autocmd using lua
vim.cmd ([[
    augroup Statusline
        au!
        au WinEnter,BufEnter * setlocal statusline=%!v:lua.StatusLine()
    augroup END
]])
