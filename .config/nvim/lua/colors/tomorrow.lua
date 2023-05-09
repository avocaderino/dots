-- base16-vim (https://github.com/chriskempson/base16-vim)
-- by Chris Kempson (http://chriskempson.com)
-- Tomorrow scheme by Chris Kempson (http://chriskempson.com)

-- GUI color definitions
local gui00        = "#ffffff"
local gui01        = "#e0e0e0"
local gui02        = "#d6d6d6"
local gui03        = "#8e908c"
local gui04        = "#969896"
local gui05        = "#4d4d4c"
local gui06        = "#282a2e"
local gui07        = "#1d1f21"
local gui08        = "#c82829"
local gui09        = "#f5871f"
local gui0A        = "#eab700"
local gui0B        = "#718c00"
local gui0C        = "#3e999f"
local gui0D        = "#4271ae"
local gui0E        = "#8959a8"
local gui0F        = "#a3685a"


-- Terminal color definitions
local cterm00        = "00"
local cterm03        = "08"
local cterm05        = "07"
local cterm07        = "15"
local cterm08        = "01"
local cterm0A        = "03"
local cterm0B        = "02"
local cterm0C        = "06"
local cterm0D        = "04"
local cterm0E        = "05"
local cterm01        = "18"
local cterm02        = "19"
local cterm04        = "20"
local cterm06        = "21"
local cterm09        = "16"
local cterm0F        = "17"


-- Theme setup
vim.cmd [[
hi clear
syntax reset
]]
vim.g.colors_name = "tomorrow"

-- Highlighting function
-- Optional variables are attributes and guisp
local function hi(hlgroup, guifg, guibg, ctermfg, ctermbg, gui, guisp)
  local cmd = {"hi", hlgroup}
  if guifg then table.insert(cmd, "guifg=" .. guifg) end
  if guibg then table.insert(cmd, "guibg=" .. guibg) end
  if ctermfg then table.insert(cmd, "ctermfg=" .. ctermfg) end
  if ctermbg then table.insert(cmd, "ctermbg=" .. ctermbg) end
  if gui then table.insert(cmd, "gui=" .. gui) end
  if guisp then table.insert(cmd, "guisp=" .. guisp) end
  vim.cmd(table.concat(cmd, " "))
end

-- Vim editor colors
hi("Normal",        gui05, gui00, cterm05, cterm00, nil, nil)
hi("Bold",          nil, nil, nil, nil, "bold", nil)
hi("Debug",         gui08, nil, cterm08, nil, nil, nil)
hi("Directory",     gui0D, nil, cterm0D, nil, nil, nil)
hi("Error",         gui00, gui08, cterm00, cterm08, nil, nil)
hi("ErrorMsg",      gui08, gui00, cterm08, cterm00, nil, nil)
hi("Exception",     gui08, nil, cterm08, nil, nil, nil)
hi("FoldColumn",    gui0C, gui01, cterm0C, cterm01, nil, nil)
hi("Folded",        gui03, gui01, cterm03, cterm01, nil, nil)
hi("IncSearch",     gui01, gui09, cterm01, cterm09, "none", nil)
hi("Italic",        nil, nil, nil, nil, "none", nil)
hi("Macro",         gui08, nil, cterm08, nil, nil, nil)
hi("MatchParen",    nil, gui03, nil, cterm03,  nil, nil)
hi("ModeMsg",       gui0B, nil, cterm0B, nil, nil, nil)
hi("MoreMsg",       gui0B, nil, cterm0B, nil, nil, nil)
hi("Question",      gui0D, nil, cterm0D, nil, nil, nil)
hi("Search",        gui01, gui0A, cterm01, cterm0A,  nil, nil)
hi("Substitute",    gui01, gui0A, cterm01, cterm0A, "none", nil)
hi("SpecialKey",    gui03, nil, cterm03, nil, nil, nil)
hi("TooLong",       gui08, nil, cterm08, nil, nil, nil)
hi("Underlined",    gui08, nil, cterm08, nil, nil, nil)
hi("Visual",        nil, gui02, nil, cterm02, nil, nil)
hi("VisualNOS",     gui08, nil, cterm08, nil, nil, nil)
hi("WarningMsg",    gui08, nil, cterm08, nil, nil, nil)
hi("WildMenu",      gui08, gui0A, cterm08, nil, nil, nil)
hi("Title",         gui0D, nil, cterm0D, nil, "none", nil)
hi("Conceal",       gui0D, gui00, cterm0D, cterm00, nil, nil)
hi("Cursor",        gui00, gui05, cterm00, cterm05, nil, nil)
hi("NonText",       gui03, nil, cterm03, nil, nil, nil)
hi("LineNr",        gui03, gui01, cterm03, cterm01, nil, nil)
hi("SignColumn",    gui03, gui01, cterm03, cterm01, nil, nil)
hi("StatusLine",    gui04, gui02, cterm04, cterm02, "none", nil)
hi("StatusLineNC",  gui03, gui01, cterm03, cterm01, "none", nil)
hi("VertSplit",     gui02, gui02, cterm02, cterm02, "none", nil)
hi("ColorColumn",   nil, gui01, nil, cterm01, "none", nil)
hi("CursorColumn",  nil, gui01, nil, cterm01, "none", nil)
hi("CursorLine",    nil, gui01, nil, cterm01, "none", nil)
hi("CursorLineNr",  gui04, gui01, cterm04, cterm01, nil, nil)
hi("QuickFixLine",  nil, gui01, nil, cterm01, "none", nil)
hi("PMenu",         gui05, gui01, cterm05, cterm01, "none", nil)
hi("PMenuSel",      gui01, gui05, cterm01, cterm05, nil, nil)
hi("TabLine",       gui03, gui01, cterm03, cterm01, "none", nil)
hi("TabLineFill",   gui03, gui01, cterm03, cterm01, "none", nil)
hi("TabLineSel",    gui0B, gui01, cterm0B, cterm01, "none", nil)

-- Standard syntax highlighting
hi("Boolean",      gui09, nil, cterm09, nil, nil, nil)
hi("Character",    gui08, nil, cterm08, nil, nil, nil)
hi("Comment",      gui03, nil, cterm03, nil, nil, nil)
hi("Conditional",  gui0E, nil, cterm0E, nil, nil, nil)
hi("Constant",     gui09, nil, cterm09, nil, nil, nil)
hi("Define",       gui0E, nil, cterm0E, nil, "none", nil)
hi("Delimiter",    gui0F, nil, cterm0F, nil, nil, nil)
hi("Float",        gui09, nil, cterm09, nil, nil, nil)
hi("Function",     gui0D, nil, cterm0D, nil, nil, nil)
hi("Identifier",   gui08, nil, cterm08, nil, "none", nil)
hi("Include",      gui0D, nil, cterm0D, nil, nil, nil)
hi("Keyword",      gui0E, nil, cterm0E, nil, nil, nil)
hi("Label",        gui0A, nil, cterm0A, nil, nil, nil)
hi("Number",       gui09, nil, cterm09, nil, nil, nil)
hi("Operator",     gui05, nil, cterm05, nil, "none", nil)
hi("PreProc",      gui0A, nil, cterm0A, nil, nil, nil)
hi("Repeat",       gui0A, nil, cterm0A, nil, nil, nil)
hi("Special",      gui0C, nil, cterm0C, nil, nil, nil)
hi("SpecialChar",  gui0F, nil, cterm0F, nil, nil, nil)
hi("Statement",    gui08, nil, cterm08, nil, nil, nil)
hi("StorageClass", gui0A, nil, cterm0A, nil, nil, nil)
hi("String",       gui0B, nil, cterm0B, nil, nil, nil)
hi("Structure",    gui0E, nil, cterm0E, nil, nil, nil)
hi("Tag",          gui0A, nil, cterm0A, nil, nil, nil)
hi("Todo",         gui0A, gui01, cterm0A, cterm01, nil, nil)
hi("Type",         gui0A, nil, cterm0A, nil, "none", nil)
hi("Typedef",      gui0A, nil, cterm0A, nil, nil, nil)

-- C highlighting
hi("cOperator",   gui0C, nil, cterm0C, nil, nil, nil)
hi("cPreCondit",  gui0E, nil, cterm0E, nil, nil, nil)

-- C# highlighting
hi("csClass",                 gui0A, nil, cterm0A, nil, nil, nil)
hi("csAttribute",             gui0A, nil, cterm0A, nil, nil, nil)
hi("csModifier",              gui0E, nil, cterm0E, nil, nil, nil)
hi("csType",                  gui08, nil, cterm08, nil, nil, nil)
hi("csUnspecifiedStatement",  gui0D, nil, cterm0D, nil, nil, nil)
hi("csContextualStatement",   gui0E, nil, cterm0E, nil, nil, nil)
hi("csNewDecleration",        gui08, nil, cterm08, nil, nil, nil)

-- CSS highlighting
hi("cssBraces",      gui05, nil, cterm05, nil, nil, nil)
hi("cssClassName",   gui0E, nil, cterm0E, nil, nil, nil)
hi("cssColor",       gui0C, nil, cterm0C, nil, nil, nil)

-- Diff highlighting
hi("DiffAdd",      gui0B, gui01,  cterm0B, cterm01, nil, nil)
hi("DiffChange",   gui03, gui01,  cterm03, cterm01, nil, nil)
hi("DiffDelete",   gui08, gui01,  cterm08, cterm01, nil, nil)
hi("DiffText",     gui0D, gui01,  cterm0D, cterm01, nil, nil)
hi("DiffAdded",    gui0B, gui00,  cterm0B, cterm00, nil, nil)
hi("DiffFile",     gui08, gui00,  cterm08, cterm00, nil, nil)
hi("DiffNewFile",  gui0B, gui00,  cterm0B, cterm00, nil, nil)
hi("DiffLine",     gui0D, gui00,  cterm0D, cterm00, nil, nil)
hi("DiffRemoved",  gui08, gui00,  cterm08, cterm00, nil, nil)

-- Git highlighting
hi("gitcommitOverflow",       gui08, nil, cterm08, nil, nil, nil)
hi("gitcommitSummary",        gui0B, nil, cterm0B, nil, nil, nil)
hi("gitcommitComment",        gui03, nil, cterm03, nil, nil, nil)
hi("gitcommitUntracked",      gui03, nil, cterm03, nil, nil, nil)
hi("gitcommitDiscarded",      gui03, nil, cterm03, nil, nil, nil)
hi("gitcommitSelected",       gui03, nil, cterm03, nil, nil, nil)
hi("gitcommitHeader",         gui0E, nil, cterm0E, nil, nil, nil)
hi("gitcommitSelectedType",   gui0D, nil, cterm0D, nil, nil, nil)
hi("gitcommitUnmergedType",   gui0D, nil, cterm0D, nil, nil, nil)
hi("gitcommitDiscardedType",  gui0D, nil, cterm0D, nil, nil, nil)
hi("gitcommitBranch",         gui09, nil, cterm09, nil, "bold", nil)
hi("gitcommitUntrackedFile",  gui0A, nil, cterm0A, nil, nil, nil)
hi("gitcommitUnmergedFile",   gui08, nil, cterm08, nil, "bold", nil)
hi("gitcommitDiscardedFile",  gui08, nil, cterm08, nil, "bold", nil)
hi("gitcommitSelectedFile",   gui0B, nil, cterm0B, nil, "bold", nil)

-- GitGutter highlighting
hi("GitGutterAdd",     gui0B, gui01, cterm0B, cterm01, nil, nil)
hi("GitGutterChange",  gui0D, gui01, cterm0D, cterm01, nil, nil)
hi("GitGutterDelete",  gui08, gui01, cterm08, cterm01, nil, nil)
hi("GitGutterChangeDelete",  gui0E, gui01, cterm0E, cterm01, nil, nil)

-- HTML highlighting
hi("htmlBold",    gui0A, nil, cterm0A, nil, nil, nil)
hi("htmlItalic",  gui0E, nil, cterm0E, nil, nil, nil)
hi("htmlEndTag",  gui05, nil, cterm05, nil, nil, nil)
hi("htmlTag",     gui05, nil, cterm05, nil, nil, nil)

-- JavaScript highlighting
hi("javaScript",        gui05, nil, cterm05, nil, nil, nil)
hi("javaScriptBraces",  gui05, nil, cterm05, nil, nil, nil)
hi("javaScriptNumber",  gui09, nil, cterm09, nil, nil, nil)
-- pangloss/vim-javascript highlighting
hi("jsOperator",          gui0D, nil, cterm0D, nil, nil, nil)
hi("jsStatement",         gui0E, nil, cterm0E, nil, nil, nil)
hi("jsReturn",            gui0E, nil, cterm0E, nil, nil, nil)
hi("jsThis",              gui08, nil, cterm08, nil, nil, nil)
hi("jsClassDefinition",   gui0A, nil, cterm0A, nil, nil, nil)
hi("jsFunction",          gui0E, nil, cterm0E, nil, nil, nil)
hi("jsFuncName",          gui0D, nil, cterm0D, nil, nil, nil)
hi("jsFuncCall",          gui0D, nil, cterm0D, nil, nil, nil)
hi("jsClassFuncName",     gui0D, nil, cterm0D, nil, nil, nil)
hi("jsClassMethodType",   gui0E, nil, cterm0E, nil, nil, nil)
hi("jsRegexpString",      gui0C, nil, cterm0C, nil, nil, nil)
hi("jsGlobalObjects",     gui0A, nil, cterm0A, nil, nil, nil)
hi("jsGlobalNodeObjects", gui0A, nil, cterm0A, nil, nil, nil)
hi("jsExceptions",        gui0A, nil, cterm0A, nil, nil, nil)
hi("jsBuiltins",          gui0A, nil, cterm0A, nil, nil, nil)

-- Mail highlighting
hi("mailQuoted1",  gui0A, nil, cterm0A, nil, nil, nil)
hi("mailQuoted2",  gui0B, nil, cterm0B, nil, nil, nil)
hi("mailQuoted3",  gui0E, nil, cterm0E, nil, nil, nil)
hi("mailQuoted4",  gui0C, nil, cterm0C, nil, nil, nil)
hi("mailQuoted5",  gui0D, nil, cterm0D, nil, nil, nil)
hi("mailQuoted6",  gui0A, nil, cterm0A, nil, nil, nil)
hi("mailURL",      gui0D, nil, cterm0D, nil, nil, nil)
hi("mailEmail",    gui0D, nil, cterm0D, nil, nil, nil)

-- Markdown highlighting
hi("markdownCode",              gui0B, nil, cterm0B, nil, nil, nil)
hi("markdownError",             gui05, gui00, cterm05, cterm00, nil, nil)
hi("markdownCodeBlock",         gui0B, nil, cterm0B, nil, nil, nil)
hi("markdownHeadingDelimiter",  gui0D, nil, cterm0D, nil, nil, nil)

-- NERDTree highlighting
hi("NERDTreeDirSlash",  gui0D, nil, cterm0D, nil, nil, nil)
hi("NERDTreeExecFile",  gui05, nil, cterm05, nil, nil, nil)

-- PHP highlighting
hi("phpMemberSelector",  gui05, nil, cterm05, nil, nil, nil)
hi("phpComparison",      gui05, nil, cterm05, nil, nil, nil)
hi("phpParent",          gui05, nil, cterm05, nil, nil, nil)
hi("phpMethodsVar",      gui0C, nil, cterm0C, nil, nil, nil)

-- Python highlighting
hi("pythonOperator",  gui0E, nil, cterm0E, nil, nil, nil)
hi("pythonRepeat",    gui0E, nil, cterm0E, nil, nil, nil)
hi("pythonInclude",   gui0E, nil, cterm0E, nil, nil, nil)
hi("pythonStatement", gui0E, nil, cterm0E, nil, nil, nil)

-- Ruby highlighting
hi("rubyAttribute",               gui0D, nil, cterm0D, nil, nil, nil)
hi("rubyConstant",                gui0A, nil, cterm0A, nil, nil, nil)
hi("rubyInterpolationDelimiter",  gui0F, nil, cterm0F, nil, nil, nil)
hi("rubyRegexp",                  gui0C, nil, cterm0C, nil, nil, nil)
hi("rubySymbol",                  gui0B, nil, cterm0B, nil, nil, nil)
hi("rubyStringDelimiter",         gui0B, nil, cterm0B, nil, nil, nil)

-- SASS highlighting
hi("sassidChar",     gui08, nil, cterm08, nil, nil, nil)
hi("sassClassChar",  gui09, nil, cterm09, nil, nil, nil)
hi("sassInclude",    gui0E, nil, cterm0E, nil, nil, nil)
hi("sassMixing",     gui0E, nil, cterm0E, nil, nil, nil)
hi("sassMixinName",  gui0D, nil, cterm0D, nil, nil, nil)

-- Signify highlighting
hi("SignifySignAdd",     gui0B, gui01, cterm0B, cterm01, nil, nil)
hi("SignifySignChange",  gui0D, gui01, cterm0D, cterm01, nil, nil)
hi("SignifySignDelete",  gui08, gui01, cterm08, cterm01, nil, nil)

-- Spelling highlighting
hi("SpellBad",     nil, nil, nil, nil, "undercurl", gui08)
hi("SpellLocal",   nil, nil, nil, nil, "undercurl", gui0C)
hi("SpellCap",     nil, nil, nil, nil, "undercurl", gui0D)
hi("SpellRare",    nil, nil, nil, nil, "undercurl", gui0E)

-- Java highlighting
hi("javaOperator",     gui0D, nil, cterm0D, nil, nil, nil)
