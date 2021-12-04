-- base16 Tomorrow Night color scheme

local highlight = function(hlgroup, guifg, guibg, gui, guisp)
    local cmd = {'hi', hlgroup}
    if guifg then table.insert(cmd, 'guifg='..guifg) end
    if guibg then table.insert(cmd, 'guibg='..guibg) end
    if gui then table.insert(cmd, 'gui='..gui) end
    if guisp then table.insert(cmd, 'guisp='..guisp) end
    vim.cmd(table.concat(cmd, ' '))
end


-- Colors
local colors = {
    base00 = "#1d1f21"; base01 = "#282a2e"; base02 = "#373b41"; base03 = "#969896";
    base04 = "#b4b7b4"; base05 = "#c5c8c6"; base06 = "#e0e0e0"; base07 = "#ffffff";
    base08 = "#cc6666"; base09 = "#de935f"; base0A = "#f0c674"; base0B = "#b5bd68";
    base0C = "#8abeb7"; base0D = "#81a2be"; base0E = "#b294bb"; base0F = "#a3685a";
}

vim.cmd [[
    hi clear
    syntax reset
]]

-- Neovim terminal colors
vim.g.terminal_color_background = colors.base00
vim.g.terminal_color_foreground = colors.base0E
vim.g.terminal_color_0 = colors.base00
vim.g.terminal_color_1 = colors.base08
vim.g.terminal_color_2 = colors.base0B
vim.g.terminal_color_3 = colors.base0A
vim.g.terminal_color_4 = colors.base0D
vim.g.terminal_color_5 = colors.base0E
vim.g.terminal_color_6 = colors.base0C
vim.g.terminal_color_7 = colors.base05
vim.g.terminal_color_8 = colors.base03
vim.g.terminal_color_9 = colors.base08
vim.g.terminal_color_10 = colors.base0B
vim.g.terminal_color_11 = colors.base0A
vim.g.terminal_color_12 = colors.base0D
vim.g.terminal_color_13 = colors.base0E
vim.g.terminal_color_14 = colors.base0C
vim.g.terminal_color_15 = colors.base07


-- Vim editor colors
highlight("Normal", colors.base05, colors.base00, nil, nil)
highlight("Bold", nil, nil, "bold", nil)
highlight("Debug", colors.base08, nil, nil, nil)
highlight("Directory", colors.base0D, nil, nil, nil)
highlight("Error", colors.base00, colors.base08, nil, nil)
highlight("ErrorMsg", colors.base08, colors.base00, nil, nil)
highlight("Exception", colors.base08, nil, nil, nil)
highlight("FoldColumn", colors.base0C, colors.base01, nil, nil)
highlight("Folded", colors.base03, colors.base01, nil, nil)
highlight("IncSearch", colors.base01, colors.base09, "none", nil)
highlight("Italic", nil, nil, "none", nil)
highlight("Macro", colors.base08, nil, nil, nil)
highlight("MatchParen", nil, colors.base03, nil, nil)
highlight("ModeMsg", colors.base0B, nil, nil, nil)
highlight("MoreMsg", colors.base0B, nil, nil, nil)
highlight("Question", colors.base0D, nil, nil, nil)
highlight("Search", colors.base01, colors.base0A, nil, nil)
highlight("Substitute", colors.base01, colors.base0A, "none", nil)
highlight("SpecialKey", colors.base03, nil, nil, nil)
highlight("TooLong", colors.base08, nil, nil, nil)
highlight("Underlined", colors.base08, nil, nil, nil)
highlight("Visual", nil, colors.base02, nil, nil)
highlight("VisualNOS", colors.base08, nil, nil, nil)
highlight("WarningMsg", colors.base08, nil, nil, nil)
highlight("WildMenu", colors.base08, colors.base0A, nil, nil)
highlight("Title", colors.base0D, nil, "none", nil)
highlight("Conceal", colors.base0D, colors.base00, nil, nil)
highlight("Cursor", colors.base00, colors.base05, nil, nil)
highlight("NonText", colors.base03, nil, nil, nil)
highlight("LineNr", colors.base03, "NONE", nil, nil)
highlight("SignColumn", colors.base03, "NONE", nil, nil)
highlight("StatusLine", colors.base04, colors.base02, "none", nil)
highlight("StatusLineNC", colors.base03, colors.base01, "none", nil)
highlight("VertSplit", colors.base02, "NONE", "none", nil)
highlight("ColorColumn", nil, colors.base01, "none", nil)
highlight("CursorColumn", nil, colors.base01, "none", nil)
highlight("CursorLine", nil, colors.base01, "none", nil)
highlight("CursorLineNr", colors.base04, "NONE", nil, nil)
highlight("QuickFixLine", nil, colors.base01, "none", nil)
highlight("PMenu", colors.base05, colors.base01, "none", nil)
highlight("PMenuSel", colors.base01, colors.base05, nil, nil)
highlight("TabLine", colors.base03, colors.base01, "none", nil)
highlight("TabLineFill", colors.base03, colors.base01, "none", nil)
highlight("TabLineSel", colors.base0B, colors.base01, "none", nil)

-- Standard syntax highlighting
highlight("Boolean", colors.base09, nil, nil, nil)
highlight("Character", colors.base08, nil, nil, nil)
highlight("Comment", colors.base03, nil, nil, nil)
highlight("Conditional", colors.base0E, nil, nil, nil)
highlight("Constant", colors.base09, nil, nil, nil)
highlight("Define", colors.base0E, nil, "none", nil)
highlight("Delimiter", colors.base0F, nil, nil, nil)
highlight("Float", colors.base09, nil, nil, nil)
highlight("Function", colors.base0D, nil, nil, nil)
highlight("Identifier", colors.base08, nil, "none", nil)
highlight("Include", colors.base0D, nil, nil, nil)
highlight("Keyword", colors.base0E, nil, nil, nil)
highlight("Label", colors.base0A, nil, nil, nil)
highlight("Number", colors.base09, nil, nil, nil)
highlight("Operator", colors.base05, nil, "none", nil)
highlight("PreProc", colors.base0A, nil, nil, nil)
highlight("Repeat", colors.base0A, nil, nil, nil)
highlight("Special", colors.base0C, nil, nil, nil)
highlight("SpecialChar", colors.base0F, nil, nil, nil)
highlight("Statement", colors.base08, nil, nil, nil)
highlight("StorageClass", colors.base0A, nil, nil, nil)
highlight("String", colors.base0B, nil, nil, nil)
highlight("Structure", colors.base0E, nil, nil, nil)
highlight("Tag", colors.base0A, nil, nil, nil)
highlight("Todo", colors.base0A, colors.base01, nil, nil)
highlight("Type", colors.base0A, nil, "none", nil)
highlight("Typedef", colors.base0A, nil, nl, nil)

---
-- Extra definitions
---

-- C highlighting
highlight("cOperator", colors.base0C, nil, nil, nil)
highlight("cPreCondit", colors.base0E, nil, nil, nil)

-- C# highlighting
highlight("csClass", colors.base0A, nil, nil, nil)
highlight("csAttribute", colors.base0A, nil, nil, nil)
highlight("csModifier", colors.base0E, nil, nil, nil)
highlight("csType", colors.base08, nil, nil, nil)
highlight("csUnspecifiedStatement", colors.base0D, nil, nil, nil)
highlight("csContextualStatement", colors.base0E, nil, nil, nil)
highlight("csNewDecleration", colors.base08, nil, nil, nil)

-- CSS highlighting
highlight("cssBraces", colors.base05, nil, nil, nil)
highlight("cssClassName", colors.base0E, nil, nil, nil)
highlight("cssColor", colors.base0C, nil, nil, nil)

-- Diff highlighting
highlight("DiffAdd", colors.base0B, colors.base01, nil, nil)
highlight("DiffChange", colors.base03, colors.base01, nil, nil)
highlight("DiffDelete", colors.base08, colors.base01, nil, nil)
highlight("DiffText", colors.base0D, colors.base01, nil, nil)
highlight("DiffAdded", colors.base0B, colors.base00, nil, nil)
highlight("DiffFile", colors.base08, colors.base00, nil, nil)
highlight("DiffNewFile", colors.base0B, colors.base00, nil, nil)
highlight("DiffLine", colors.base0D, colors.base00, nil, nil)
highlight("DiffRemoved", colors.base08, colors.base00, nil, nil)

-- Git highlighting
highlight("gitcommitOverflow", colors.base08, nil, nil, nil)
highlight("gitcommitSummary", colors.base0B, nil, nil, nil)
highlight("gitcommitComment", colors.base03, nil, nil, nil)
highlight("gitcommitUntracked", colors.base03, nil, nil, nil)
highlight("gitcommitDiscarded", colors.base03, nil, nil, nil)
highlight("gitcommitSelected", colors.base03, nil, nil, nil)
highlight("gitcommitHeader", colors.base0E, nil, nil, nil)
highlight("gitcommitSelectedType", colors.base0D, nil, nil, nil)
highlight("gitcommitUnmergedType", colors.base0D, nil, nil, nil)
highlight("gitcommitDiscardedType", colors.base0D, nil, nil, nil)
highlight("gitcommitBranch", colors.base09, nil, "bold", nil)
highlight("gitcommitUntrackedFile", colors.base0A, nil, nil, nil)
highlight("gitcommitUnmergedFile", colors.base08, nil, "bold", nil)
highlight("gitcommitDiscardedFile", colors.base08, nil, "bold", nil)
highlight("gitcommitSelectedFile", colors.base0B, nil, "bold", nil)

-- HTML highlighting
highlight("htmlBold", colors.base0A, nil, nil, nil)
highlight("htmlItalic", colors.base0E, nil, nil, nil)
highlight("htmlEndTag", colors.base05, nil, nil, nil)
highlight("htmlTag", colors.base05, nil, nil, nil)

-- JavaScript highlighting
highlight("javaScript", colors.base05, nil, nil, nil)
highlight("javaScriptBraces", colors.base05, nil, nil, nil)
highlight("javaScriptNumber", colors.base09, nil, nil, nil)
-- pangloss/vim-javascript highlighting
highlight("jsOperator", colors.base0D, nil, nil, nil)
highlight("jsStatement", colors.base0E, nil, nil, nil)
highlight("jsReturn", colors.base0E, nil, nil, nil)
highlight("jsThis", colors.base08, nil, nil, nil)
highlight("jsClassDefinition", colors.base0A, nil, nil, nil)
highlight("jsFunction", colors.base0E, nil, nil, nil)
highlight("jsFuncName", colors.base0D, nil, nil, nil)
highlight("jsFuncCall", colors.base0D, nil, nil, nil)
highlight("jsClassFuncName", colors.base0D, nil, nil, nil)
highlight("jsClassMethodType", colors.base0E, nil, nil, nil)
highlight("jsRegexpString", colors.base0C, nil, nil, nil)
highlight("jsGlobalObjects", colors.base0A, nil, nil, nil)
highlight("jsGlobalNodeObjects", colors.base0A, nil, nil, nil)
highlight("jsExceptions", colors.base0A, nil, nil, nil)
highlight("jsBuiltins", colors.base0A, nil, nil, nil)

-- Mail highlighting
highlight("mailQuoted1", colors.base0A, nil, nil, nil)
highlight("mailQuoted2", colors.base0B, nil, nil, nil)
highlight("mailQuoted3", colors.base0E, nil, nil, nil)
highlight("mailQuoted4", colors.base0C, nil, nil, nil)
highlight("mailQuoted5", colors.base0D, nil, nil, nil)
highlight("mailQuoted6", colors.base0A, nil, nil, nil)
highlight("mailURL", colors.base0D, nil, nil, nil)
highlight("mailEmail", colors.base0D, nil, nil, nil)

-- Markdown highlighting
highlight("markdownCode", colors.base0B, nil, nil, nil)
highlight("markdownError", colors.base05, colors.base00, nil, nil)
highlight("markdownCodeBlock", colors.base0B, nil, nil, nil)
highlight("markdownHeadingDelimiter", colors.base0D, nil, nil, nil)

-- PHP highlighting
highlight("phpMemberSelector", colors.base05, nil, nil, nil)
highlight("phpComparison", colors.base05, nil, nil, nil)
highlight("phpParent", colors.base05, nil, nil, nil)
highlight("phpMethodsVar", colors.base0C, nil, nil, nil)

-- Python highlighting
highlight("pythonOperator", colors.base0E, nil, nil, nil)
highlight("pythonRepeat", colors.base0E, nil, nil, nil)
highlight("pythonInclude", colors.base0E, nil, nil, nil)
highlight("pythonStatement", colors.base0E, nil, nil, nil)

-- Ruby highlighting
highlight("rubyAttribute", colors.base0D, nil, nil, nil)
highlight("rubyConstant", colors.base0A, nil, nil, nil)
highlight("rubyInterpolationDelimiter", colors.base0F, nil, nil, nil)
highlight("rubyRegexp", colors.base0C, nil, nil, nil)
highlight("rubySymbol", colors.base0B, nil, nil, nil)
highlight("rubyStringDelimiter", colors.base0B, nil, nil, nil)

-- SASS highlighting
highlight("sassidChar", colors.base08, nil, nil, nil)
highlight("sassClassChar", colors.base09, nil, nil, nil)
highlight("sassInclude", colors.base0E, nil, nil, nil)
highlight("sassMixing", colors.base0E, nil, nil, nil)
highlight("sassMixinName", colors.base0D, nil, nil, nil)

-- Spelling highlighting
highlight("SpellBad", nil, nil, "undercurl", colors.base08)
highlight("SpellLocal", nil, nil, "undercurl", colors.base0C)
highlight("SpellCap", nil, nil, "undercurl", colors.base0D)
highlight("SpellRare", nil, nil, "undercurl", colors.base0E)

-- Java highlighting
highlight("javaOperator", colors.base0D, nil, nil, nil)

-- LspDiagnostic base highlight group
highlight("LspDiagnosticsDefaultError", colors.base08, nil, nil, nil)
highlight("LspDiagnosticsDefaultWarning", colors.base0A, nil, nil, nil)
highlight("LspDiagnosticsDefaultInformation", colors.base0D, nil, nil, nil)
highlight("LspDiagnosticsDefaultHint", colors.base0C, nil, nil, nil)
