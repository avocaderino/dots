-- base16 Tomorrow Night color scheme

local highlight = function(hlgroup, guifg, guibg, gui, guisp)
    local cmd = {'hi', hlgroup}
    if guifg then table.insert(cmd, 'guifg='..guifg) end
    if guibg then table.insert(cmd, 'guibg='..guibg) end
    if gui then table.insert(cmd, 'gui='..gui) end
    if guisp then table.insert(cmd, 'guisp='..guisp) end
    vim.cmd(table.concat(cmd, ' '))
end

vim.cmd [[
hi clear
syntax reset
]]

-- Colors
local base00 = "#1d1f21"
local base01 = "#282a2e"
local base02 = "#373b41"
local base03 = "#969896"
local base04 = "#b4b7b4"
local base05 = "#c5c8c6"
local base06 = "#e0e0e0"
local base07 = "#ffffff"
local base08 = "#cc6666"
local base09 = "#de935f"
local base0A = "#f0c674"
local base0B = "#b5bd68"
local base0C = "#8abeb7"
local base0D = "#81a2be"
local base0E = "#b294bb"
local base0F = "#a3685a"

-- Vim editor colors
highlight("Normal",         base05, base00, nil, nil)
highlight("Bold",           nil, nil, "bold", nil)
highlight("Debug",          base08, nil, nil, nil)
highlight("Directory",      base0D, nil, nil, nil)
highlight("Error",          base00, base08, nil, nil)
highlight("ErrorMsg",       base08, base00, nil, nil)
highlight("Exception",      base08, nil, nil, nil)
highlight("FoldColumn",     base0C, base01, nil, nil)
highlight("Folded",         base03, base01, nil, nil)
highlight("IncSearch",      base01, base09, "none", nil)
highlight("Italic",         nil, nil, "italic", nil)
highlight("Macro",          base08, nil, nil, nil)
highlight("MatchParen",     nil, base03, nil, nil)
highlight("ModeMsg",        base0B, nil, nil, nil)
highlight("MoreMsg",        base0B, nil, nil, nil)
highlight("Question",       base0D, nil, nil, nil)
highlight("Search",         base01, base0A, nil, nil)
highlight("Substitute",     base01, base0A, "none", nil)
highlight("SpecialKey",     base03, nil, nil, nil)
highlight("TooLong",        base08, nil, nil, nil)
highlight("Underlined",     base08, nil, nil, nil)
highlight("Visual",         nil, base02, nil, nil)
highlight("VisualNOS",      base08, nil, nil, nil)
highlight("WarningMsg",     base08, nil, nil, nil)
highlight("WildMenu",       base08, base0A, nil, nil)
highlight("Title",          base0D, nil, "none", nil)
highlight("Conceal",        base0D, base00, nil, nil)
highlight("Cursor",         base00, base05, nil, nil)
highlight("NonText",        base03, nil, nil, nil)
highlight("LineNr",         base03, "none", nil, nil)
highlight("SignColumn",     base03, "none", nil, nil)
highlight("StatusLine",     base04, base02, "none", nil)
highlight("StatusLineNC",   base03, base01, "none", nil)
highlight("VertSplit",      base02, "none", "none", nil)
highlight("ColorColumn",    nil, base01, "none", nil)
highlight("CursorColumn",   nil, base01, "none", nil)
highlight("CursorLine",     nil, base01, "none", nil)
highlight("CursorLineNr",   base04, "none", nil, nil)
highlight("QuickFixLine",   nil, base01, "none", nil)
highlight("PMenu",          base05, base01, "none", nil)
highlight("PMenuSel",       base01, base05, nil, nil)
highlight("TabLine",        base03, base01, "none", nil)
highlight("TabLineFill",    base03, base01, "none", nil)
highlight("TabLineSel",     base0B, base01, "none", nil)

-- Standard syntax highlighting
highlight("Boolean",        base09, nil, nil, nil)
highlight("Character",      base08, nil, nil, nil)
highlight("Comment",        base03, nil, "italic", nil)
highlight("Conditional",    base0E, nil, nil, nil)
highlight("Constant",       base09, nil, nil, nil)
highlight("Define",         base0E, nil, "none", nil)
highlight("Delimiter",      base0F, nil, nil, nil)
highlight("Float",          base09, nil, nil, nil)
highlight("Function",       base0D, nil, nil, nil)
highlight("Identifier",     base08, nil, "none", nil)
highlight("Include",        base0D, nil, nil, nil)
highlight("Keyword",        base0E, nil, nil, nil)
highlight("Label",          base0A, nil, nil, nil)
highlight("Number",         base09, nil, nil, nil)
highlight("Operator",       base05, nil, "none", nil)
highlight("PreProc",        base0A, nil, nil, nil)
highlight("Repeat",         base0A, nil, nil, nil)
highlight("Special",        base0C, nil, nil, nil)
highlight("SpecialChar",    base0F, nil, nil, nil)
highlight("Statement",      base08, nil, nil, nil)
highlight("StorageClass",   base0A, nil, nil, nil)
highlight("String",         base0B, nil, nil, nil)
highlight("Structure",      base0E, nil, nil, nil)
highlight("Tag",            base0A, nil, nil, nil)
highlight("Todo",           base0A, base01, nil, nil)
highlight("Type",           base0A, nil, "none", nil)
highlight("Typedef",        base0A, nil, nil, nil)

---
-- Extra definitions
---

-- C highlighting
highlight("cOperator",      base0C, nil, nil, nil)
highlight("cPreCondit",     base0E, nil, nil, nil)

-- C# highlighting
highlight("csClass",                base0A, nil, nil, nil)
highlight("csAttribute",            base0A, nil, nil, nil)
highlight("csModifier",             base0E, nil, nil, nil)
highlight("csType",                 base08, nil, nil, nil)
highlight("csUnspecifiedStatement", base0D, nil, nil, nil)
highlight("csContextualStatement",  base0E, nil, nil, nil)
highlight("csNewDecleration",       base08, nil, nil, nil)

-- CSS highlighting
highlight("cssBraces",      base05, nil, nil, nil)
highlight("cssClassName",   base0E, nil, nil, nil)
highlight("cssColor",       base0C, nil, nil, nil)

-- Diff highlighting
highlight("DiffAdd",        base0B, base01, nil, nil)
highlight("DiffChange",     base03, base01, nil, nil)
highlight("DiffDelete",     base08, base01, nil, nil)
highlight("DiffText",       base0D, base01, nil, nil)
highlight("DiffAdded",      base0B, base00, nil, nil)
highlight("DiffFile",       base08, base00, nil, nil)
highlight("DiffNewFile",    base0B, base00, nil, nil)
highlight("DiffLine",       base0D, base00, nil, nil)
highlight("DiffRemoved",    base08, base00, nil, nil)

-- Git highlighting
highlight("gitcommitOverflow",      base08, nil, nil, nil)
highlight("gitcommitSummary",       base0B, nil, nil, nil)
highlight("gitcommitComment",       base03, nil, nil, nil)
highlight("gitcommitUntracked",     base03, nil, nil, nil)
highlight("gitcommitDiscarded",     base03, nil, nil, nil)
highlight("gitcommitSelected",      base03, nil, nil, nil)
highlight("gitcommitHeader",        base0E, nil, nil, nil)
highlight("gitcommitSelectedType",  base0D, nil, nil, nil)
highlight("gitcommitUnmergedType",  base0D, nil, nil, nil)
highlight("gitcommitDiscardedType", base0D, nil, nil, nil)
highlight("gitcommitBranch",        base09, nil, "bold", nil)
highlight("gitcommitUntrackedFile", base0A, nil, nil, nil)
highlight("gitcommitUnmergedFile",  base08, nil, "bold", nil)
highlight("gitcommitDiscardedFile", base08, nil, "bold", nil)
highlight("gitcommitSelectedFile",  base0B, nil, "bold", nil)

-- HTML highlighting
highlight("htmlBold",   base0A, nil, nil, nil)
highlight("htmlItalic", base0E, nil, nil, nil)
highlight("htmlEndTag", base05, nil, nil, nil)
highlight("htmlTag",    base05, nil, nil, nil)

-- JavaScript highlighting
highlight("javaScript",             base05, nil, nil, nil)
highlight("javaScriptBraces",       base05, nil, nil, nil)
highlight("javaScriptNumber",       base09, nil, nil, nil)
-- pangloss/vim-javascript highlighting
highlight("jsOperator",             base0D, nil, nil, nil)
highlight("jsStatement",            base0E, nil, nil, nil)
highlight("jsReturn",               base0E, nil, nil, nil)
highlight("jsThis",                 base08, nil, nil, nil)
highlight("jsClassDefinition",      base0A, nil, nil, nil)
highlight("jsFunction",             base0E, nil, nil, nil)
highlight("jsFuncName",             base0D, nil, nil, nil)
highlight("jsFuncCall",             base0D, nil, nil, nil)
highlight("jsClassFuncName",        base0D, nil, nil, nil)
highlight("jsClassMethodType",      base0E, nil, nil, nil)
highlight("jsRegexpString",         base0C, nil, nil, nil)
highlight("jsGlobalObjects",        base0A, nil, nil, nil)
highlight("jsGlobalNodeObjects",    base0A, nil, nil, nil)
highlight("jsExceptions",           base0A, nil, nil, nil)
highlight("jsBuiltins",             base0A, nil, nil, nil)

-- Mail highlighting
highlight("mailQuoted1",    base0A, nil, nil, nil)
highlight("mailQuoted2",    base0B, nil, nil, nil)
highlight("mailQuoted3",    base0E, nil, nil, nil)
highlight("mailQuoted4",    base0C, nil, nil, nil)
highlight("mailQuoted5",    base0D, nil, nil, nil)
highlight("mailQuoted6",    base0A, nil, nil, nil)
highlight("mailURL",        base0D, nil, nil, nil)
highlight("mailEmail",      base0D, nil, nil, nil)

-- Markdown highlighting
highlight("markdownCode",               base0B, nil, nil, nil)
highlight("markdownError",              base05, base00, nil, nil)
highlight("markdownCodeBlock",          base0B, nil, nil, nil)
highlight("markdownHeadingDelimiter",   base0D, nil, nil, nil)

-- PHP highlighting
highlight("phpMemberSelector",  base05, nil, nil, nil)
highlight("phpComparison",      base05, nil, nil, nil)
highlight("phpParent",          base05, nil, nil, nil)
highlight("phpMethodsVar",      base0C, nil, nil, nil)

-- Python highlighting
highlight("pythonOperator",     base0E, nil, nil, nil)
highlight("pythonRepeat",       base0E, nil, nil, nil)
highlight("pythonInclude",      base0E, nil, nil, nil)
highlight("pythonStatement",    base0E, nil, nil, nil)

-- Ruby highlighting
highlight("rubyAttribute",              base0D, nil, nil, nil)
highlight("rubyConstant",               base0A, nil, nil, nil)
highlight("rubyInterpolationDelimiter", base0F, nil, nil, nil)
highlight("rubyRegexp",                 base0C, nil, nil, nil)
highlight("rubySymbol",                 base0B, nil, nil, nil)
highlight("rubyStringDelimiter",        base0B, nil, nil, nil)

-- SASS highlighting
highlight("sassidChar",     base08, nil, nil, nil)
highlight("sassClassChar",  base09, nil, nil, nil)
highlight("sassInclude",    base0E, nil, nil, nil)
highlight("sassMixing",     base0E, nil, nil, nil)
highlight("sassMixinName",  base0D, nil, nil, nil)

-- Spelling highlighting
highlight("SpellBad",       nil, nil, "undercurl", base08)
highlight("SpellLocal",     nil, nil, "undercurl", base0C)
highlight("SpellCap",       nil, nil, "undercurl", base0D)
highlight("SpellRare",      nil, nil, "undercurl", base0E)

-- Java highlighting
highlight("javaOperator",   base0D, nil, nil, nil)

-- LspDiagnostic base highlight group
highlight("LspDiagnosticsDefaultError",         base08, nil, nil, nil)
highlight("LspDiagnosticsDefaultWarning",       base0A, nil, nil, nil)
highlight("LspDiagnosticsDefaultInformation",   base0D, nil, nil, nil)
highlight("LspDiagnosticsDefaultHint",          base0C, nil, nil, nil)
