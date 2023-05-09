
-- -----------------------------------------------------------------------------
-- Name:         Tokyo Night
-- Description:  A clean, dark Vim theme that celebrates the lights of downtown Tokyo at night (Based on the VS Code version of the theme)
-- Author:       Ghifari Taqiuddin <mghifarit53@gmail.com>
-- Website:      http//github.com/ghifarit53/tokyonight.vim/
-- License:      MIT
-- -----------------------------------------------------------------------------

-- Initialization: {{{
vim.cmd [[
highlight clear
syntax reset
]]
vim.opt.background=dark
vim.g.colors_name = "tokyonight"

local tokyo = {}

local style = "night"
local enable_italic = true
local menu_selection_background = "blue"
-- }}}

-- Palette: {{{

if style == "storm" then
  tokyo.palette = {
    black =      {"#06080a",   "237",  "DarkGrey"},
    bg0 =        {"#24283b",   "235",  "Black"},
    bg1 =        {"#282d42",   "236",  "DarkGrey"},
    bg2 =        {"#2f344d",   "236",  "DarkGrey"},
    bg3 =        {"#333954",   "237",  "DarkGrey"},
    bg4 =        {"#3a405e",   "237",  "Grey"},
    bg_red =     {"#ff7a93",   "203",  "Red"},
    diff_red =   {"#803d49",   "52",   "DarkRed"},
    bg_green =   {"#b9f27c",   "107",  "Green"},
    diff_green = {"#618041",   "22",   "DarkGreen"},
    bg_blue =    {"#7da6ff",   "110",  "Blue"},
    diff_blue =  {"#3e5380",   "17",   "DarkBlue"},
    fg =         {"#a9b1d6",   "250",  "White"},
    red =        {"#F7768E",   "203",  "Red"},
    orange =     {"#FF9E64",   "215",  "Orange"},
    yellow =     {"#E0AF68",   "179",  "Yellow"},
    green =      {"#9ECE6A",   "107",  "Green"},
    blue =       {"#7AA2F7",   "110",  "Blue"},
    purple =     {"#ad8ee6",   "176",  "Magenta"},
    grey =       {"#444B6A",   "246",  "LightGrey"},
    none =       {"NONE",      "NONE", "NONE"}
  }
elseif style == "night" then
  tokyo.palette = {
    black =      {"#06080a",   "237",  "DarkGrey"},
    bg0 =        {"#1a1b26",   "235",  "Black"},
    bg1 =        {"#232433",   "236",  "DarkGrey"},
    bg2 =        {"#2a2b3d",   "236",  "DarkGrey"},
    bg3 =        {"#32344a",   "237",  "DarkGrey"},
    bg4 =        {"#3b3d57",   "237",  "Grey"},
    bg_red =     {"#ff7a93",   "203",  "Red"},
    diff_red =   {"#803d49",   "52",   "DarkRed"},
    bg_green =   {"#b9f27c",   "107",  "Green"},
    diff_green = {"#618041",   "22",   "DarkGreen"},
    bg_blue =    {"#7da6ff",   "110",  "Blue"},
    diff_blue =  {"#3e5380",   "17",   "DarkBlue"},
    fg =         {"#a9b1d6",   "250",  "White"},
    red =        {"#F7768E",   "203",  "Red"},
    orange =     {"#FF9E64",   "215",  "Orange"},
    yellow =     {"#E0AF68",   "179",  "Yellow"},
    green =      {"#9ECE6A",   "107",  "Green"},
    blue =       {"#7AA2F7",   "110",  "Blue"},
    purple =     {"#ad8ee6",   "176",  "Magenta"},
    grey =       {"#444B6A",   "246",  "LightGrey"},
    none =       {"NONE",      "NONE", "NONE"}
  }
end

-- }}}

-- Function: {{{
-- hi(group, foreground, background)
-- hi(group, foreground, background, gui, guisp)
-- E.g.:
-- hi("Normal", palette.fg, palette.bg0)
tokyo.hi = function(group, fg, bg, gui, guisp)
  local cmd = {"hi", group}
  if fg then table.insert(cmd, "guifg=" .. fg[1] .. " ctermfg=" .. fg[2]) end
  if bg then table.insert(cmd, "guibg=" .. bg[1] .. " ctermbg=" .. bg[2]) end
  if gui then table.insert(cmd, "gui=" .. gui) end
  if guisp then table.insert(cmd, "guisp=" .. guisp[1]) end
  vim.cmd(table.concat(cmd, " "))
end

tokyo.link = function(fromto)
  local from = fromto:match("%w+")
  local to = fromto:match("%w+$")
  vim.cmd(string.format("hi link %s %s", from, to))
end

-- }}}

-- Common Highlight Group {{{
-- UI: {{{
tokyo.hi("Normal", tokyo.palette.fg, tokyo.palette.bg0)
tokyo.hi("Terminal", tokyo.palette.fg, tokyo.palette.bg0)
tokyo.hi("EndOfBuffer", tokyo.palette.bg0, tokyo.palette.bg0)
tokyo.hi("FoldColumn", tokyo.palette.grey, tokyo.palette.bg1)
tokyo.hi("Folded", tokyo.palette.grey, tokyo.palette.bg1)
tokyo.hi("SignColumn", tokyo.palette.fg, tokyo.palette.bg1)
tokyo.hi("ToolbarLine", tokyo.palette.fg, tokyo.palette.bg2)
tokyo.hi("ColorColumn", tokyo.palette.none, tokyo.palette.bg1)
tokyo.hi("Conceal", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("Cursor", tokyo.palette.none, tokyo.palette.none, "reverse")
tokyo.link "vCursor Cursor"
tokyo.link "iCursor Cursor"
tokyo.link "lCursor Cursor"
tokyo.link "CursorIM Cursor"
tokyo.hi("CursorColumn", tokyo.palette.none, tokyo.palette.bg1)
tokyo.hi("CursorLine", tokyo.palette.none, tokyo.palette.bg1)
tokyo.hi("LineNr", tokyo.palette.grey, tokyo.palette.none)
if vim.opt.relativenumber == 1 and vim.opt.cursorline == 0 then
tokyo.hi("CursorLineNr", tokyo.palette.fg, tokyo.palette.none)
else
tokyo.hi("CursorLineNr", tokyo.palette.fg, tokyo.palette.bg1)
end
tokyo.hi("DiffAdd", tokyo.palette.none, tokyo.palette.diff_green)
tokyo.hi("DiffChange", tokyo.palette.none, tokyo.palette.diff_blue)
tokyo.hi("DiffDelete", tokyo.palette.none, tokyo.palette.diff_red)
tokyo.hi("DiffText", tokyo.palette.none, tokyo.palette.none, "reverse")
tokyo.hi("Directory", tokyo.palette.green, tokyo.palette.none)
tokyo.hi("ErrorMsg", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("WarningMsg", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.hi("ModeMsg", tokyo.palette.fg, tokyo.palette.none, "bold")
tokyo.hi("MoreMsg", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.hi("IncSearch", tokyo.palette.bg0, tokyo.palette.bg_red)
tokyo.hi("Search", tokyo.palette.bg0, tokyo.palette.bg_green)
tokyo.hi("MatchParen", tokyo.palette.none, tokyo.palette.bg4)
tokyo.hi("NonText", tokyo.palette.bg4, tokyo.palette.none)
tokyo.hi("Whitespace", tokyo.palette.bg4, tokyo.palette.none)
tokyo.hi("SpecialKey", tokyo.palette.bg4, tokyo.palette.none)
tokyo.hi("Pmenu", tokyo.palette.fg, tokyo.palette.bg2)
tokyo.hi("PmenuSbar", tokyo.palette.none, tokyo.palette.bg2)
if menu_selection_background == "blue" then
tokyo.hi("PmenuSel", tokyo.palette.bg0, tokyo.palette.bg_blue)
tokyo.hi("WildMenu", tokyo.palette.bg0, tokyo.palette.bg_blue)
elseif menu_selection_background == "green" then
tokyo.hi("PmenuSel", tokyo.palette.bg0, tokyo.palette.bg_green)
tokyo.hi("WildMenu", tokyo.palette.bg0, tokyo.palette.bg_green)
elseif menu_selection_background == "red" then
tokyo.hi("PmenuSel", tokyo.palette.bg0, tokyo.palette.bg_red)
tokyo.hi("WildMenu", tokyo.palette.bg0, tokyo.palette.bg_red)
end
tokyo.hi("PmenuThumb", tokyo.palette.none, tokyo.palette.grey)
tokyo.hi("Question", tokyo.palette.yellow, tokyo.palette.none)
tokyo.hi("SpellBad", tokyo.palette.red, tokyo.palette.none, "undercurl", tokyo.palette.red)
tokyo.hi("SpellCap", tokyo.palette.yellow, tokyo.palette.none, "undercurl", tokyo.palette.yellow)
tokyo.hi("SpellLocal", tokyo.palette.blue, tokyo.palette.none, "undercurl", tokyo.palette.blue)
tokyo.hi("SpellRare", tokyo.palette.purple, tokyo.palette.none, "undercurl", tokyo.palette.purple)
tokyo.hi("StatusLine", tokyo.palette.fg, tokyo.palette.bg3)
tokyo.hi("StatusLineTerm", tokyo.palette.fg, tokyo.palette.bg3)
tokyo.hi("StatusLineNC", tokyo.palette.grey, tokyo.palette.bg1)
tokyo.hi("StatusLineTermNC", tokyo.palette.grey, tokyo.palette.bg1)
tokyo.hi("TabLine", tokyo.palette.fg, tokyo.palette.bg4)
tokyo.hi("TabLineFill", tokyo.palette.grey, tokyo.palette.bg1)
tokyo.hi("TabLineSel", tokyo.palette.bg0, tokyo.palette.bg_red)
tokyo.hi("VertSplit", tokyo.palette.black, tokyo.palette.none)
tokyo.hi("Visual", tokyo.palette.none, tokyo.palette.bg3)
tokyo.hi("VisualNOS", tokyo.palette.none, tokyo.palette.bg3, "underline")
tokyo.hi("QuickFixLine", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.hi("Debug", tokyo.palette.yellow, tokyo.palette.none)
tokyo.hi("debugPC", tokyo.palette.bg0, tokyo.palette.green)
tokyo.hi("debugBreakpoint", tokyo.palette.bg0, tokyo.palette.red)
tokyo.hi("ToolbarButton", tokyo.palette.bg0, tokyo.palette.bg_blue)
tokyo.link "healthError Red"
tokyo.link "healthSuccess Green"
tokyo.link "healthWarning Yellow"
tokyo.link "LspDiagnosticsError Grey"
tokyo.link "LspDiagnosticsWarning Grey"
tokyo.link "LspDiagnosticsInformation Grey"
tokyo.link "LspDiagnosticsHint Grey"
tokyo.link "LspReferenceText CocHighlightText"
tokyo.link "LspReferenceRead CocHighlightText"
tokyo.link "LspReferenceWrite CocHighlightText"

-- }}}
-- Syntax: {{{
if enable_italic then
tokyo.hi("Type", tokyo.palette.blue, tokyo.palette.none, "italic")
tokyo.hi("Structure", tokyo.palette.blue, tokyo.palette.none, "italic")
tokyo.hi("StorageClass", tokyo.palette.blue, tokyo.palette.none, "italic")
tokyo.hi("Identifier", tokyo.palette.orange, tokyo.palette.none, "italic")
tokyo.hi("Constant", tokyo.palette.orange, tokyo.palette.none, "italic")
else
tokyo.hi("Type", tokyo.palette.blue, tokyo.palette.none)
tokyo.hi("Structure", tokyo.palette.blue, tokyo.palette.none)
tokyo.hi("StorageClass", tokyo.palette.blue, tokyo.palette.none)
tokyo.hi("Identifier", tokyo.palette.orange, tokyo.palette.none)
tokyo.hi("Constant", tokyo.palette.orange, tokyo.palette.none)
end
tokyo.hi("PreProc", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("PreCondit", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Include", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Keyword", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Define", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Typedef", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Exception", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Conditional", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Repeat", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Statement", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Macro", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("Error", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Label", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("Special", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("SpecialChar", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("Boolean", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("String", tokyo.palette.yellow, tokyo.palette.none)
tokyo.hi("Character", tokyo.palette.yellow, tokyo.palette.none)
tokyo.hi("Number", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("Float", tokyo.palette.purple, tokyo.palette.none)
tokyo.hi("Function", tokyo.palette.green, tokyo.palette.none)
tokyo.hi("Operator", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Title", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("Tag", tokyo.palette.orange, tokyo.palette.none)
tokyo.hi("Delimiter", tokyo.palette.fg, tokyo.palette.none)
if disable_italic_comment then
tokyo.hi("Comment", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("SpecialComment", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("Todo", tokyo.palette.blue, tokyo.palette.none)
else
tokyo.hi("Comment", tokyo.palette.grey, tokyo.palette.none, "italic")
tokyo.hi("SpecialComment", tokyo.palette.grey, tokyo.palette.none, "italic")
tokyo.hi("Todo", tokyo.palette.blue, tokyo.palette.none, "italic")
end
tokyo.hi("Ignore", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("Underlined", tokyo.palette.none, tokyo.palette.none, "underline")
-- }}}
-- Predefined Highlight Group {{{
tokyo.hi("Fg", tokyo.palette.fg, tokyo.palette.none)
tokyo.hi("Grey", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("Red", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("Orange", tokyo.palette.orange, tokyo.palette.none)
tokyo.hi("Yellow", tokyo.palette.yellow, tokyo.palette.none)
tokyo.hi("Green", tokyo.palette.green, tokyo.palette.none)
tokyo.hi("Blue", tokyo.palette.blue, tokyo.palette.none)
tokyo.hi("Purple", tokyo.palette.purple, tokyo.palette.none)
if enable_italic then
tokyo.hi("RedItalic", tokyo.palette.red, tokyo.palette.none, "italic")
tokyo.hi("BlueItalic", tokyo.palette.blue, tokyo.palette.none, "italic")
tokyo.hi("OrangeItalic", tokyo.palette.orange, tokyo.palette.none, "italic")
else
tokyo.hi("RedItalic", tokyo.palette.red, tokyo.palette.none)
tokyo.hi("BlueItalic", tokyo.palette.blue, tokyo.palette.none)
tokyo.hi("OrangeItalic", tokyo.palette.orange, tokyo.palette.none)
end
-- }}}
-- }}}

-- Extended File Type {{{
-- Markdown: {{{
-- builtin: {{{
tokyo.hi("markdownH1", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("markdownH2", tokyo.palette.orange, tokyo.palette.none, "bold")
tokyo.hi("markdownH3", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.hi("markdownH4", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("markdownH5", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.hi("markdownH6", tokyo.palette.purple, tokyo.palette.none, "bold")
tokyo.hi("markdownUrl", tokyo.palette.blue, tokyo.palette.none, "underline")
tokyo.hi("markdownItalic", tokyo.palette.none, tokyo.palette.none, "italic")
tokyo.hi("markdownBold", tokyo.palette.none, tokyo.palette.none, "bold")
tokyo.hi("markdownItalicDelimiter", tokyo.palette.grey, tokyo.palette.none, "italic")
tokyo.link "markdownCode Green"
tokyo.link "markdownCodeBlock Green"
tokyo.link "markdownCodeDelimiter Green"
tokyo.link "markdownBlockquote Grey"
tokyo.link "markdownListMarker Red"
tokyo.link "markdownOrderedListMarker Red"
tokyo.link "markdownRule Purple"
tokyo.link "markdownHeadingRule Grey"
tokyo.link "markdownUrlDelimiter Grey"
tokyo.link "markdownLinkDelimiter Grey"
tokyo.link "markdownLinkTextDelimiter Grey"
tokyo.link "markdownHeadingDelimiter Grey"
tokyo.link "markdownLinkText Red"
tokyo.link "markdownUrlTitleDelimiter Green"
tokyo.link "markdownIdDeclaration markdownLinkText"
tokyo.link "markdownBoldDelimiter Grey"
tokyo.link "markdownId Yellow"
-- }}}
-- vim-markdown: http//github.com/gabrielelana/vim-markdown{{{
tokyo.hi("mkdURL", tokyo.palette.blue, tokyo.palette.none, "underline")
tokyo.hi("mkdInlineURL", tokyo.palette.blue, tokyo.palette.none, "underline")
tokyo.hi("mkdItalic", tokyo.palette.grey, tokyo.palette.none, "italic")
tokyo.link "mkdCodeDelimiter Green"
tokyo.link "mkdBold Grey"
tokyo.link "mkdLink Red"
tokyo.link "mkdHeading Grey"
tokyo.link "mkdListItem Red"
tokyo.link "mkdRule Purple"
tokyo.link "mkdDelimiter Grey"
tokyo.link "mkdId Yellow"
-- }}}
-- }}}
-- ReStructuredText: {{{
-- builtin: http//github.com/marshallward/vim-restructuredtext{{{
tokyo.hi("rstStandaloneHyperlink", tokyo.palette.purple, tokyo.palette.none, "underline")
tokyo.hi("rstEmphasis", tokyo.palette.none, tokyo.palette.none, "italic")
tokyo.hi("rstStrongEmphasis", tokyo.palette.none, tokyo.palette.none, "bold")
tokyo.hi("rstStandaloneHyperlink", tokyo.palette.blue, tokyo.palette.none, "underline")
tokyo.hi("rstHyperlinkTarget", tokyo.palette.blue, tokyo.palette.none, "underline")
tokyo.link "rstSubstitutionReference Blue"
tokyo.link "rstInterpretedTextOrHyperlinkReference Green"
tokyo.link "rstTableLines Grey"
tokyo.link "rstInlineLiteral Green"
tokyo.link "rstLiteralBlock Green"
tokyo.link "rstQuotedLiteralBlock Green"
-- }}}
-- }}}
-- LaTex: {{{
-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
tokyo.link "texStatement BlueItalic"
tokyo.link "texOnlyMath Grey"
tokyo.link "texDefName Yellow"
tokyo.link "texNewCmd Orange"
tokyo.link "texCmdName Blue"
tokyo.link "texBeginEnd Red"
tokyo.link "texBeginEndName Green"
tokyo.link "texDocType RedItalic"
tokyo.link "texDocTypeArgs Orange"
tokyo.link "texInputFile Green"
-- }}}
-- }}}
-- Html: {{{
-- builtin: http//notabug.org/jorgesumle/vim-html-syntax{{{
tokyo.hi("htmlH1", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("htmlH2", tokyo.palette.orange, tokyo.palette.none, "bold")
tokyo.hi("htmlH3", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.hi("htmlH4", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("htmlH5", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.hi("htmlH6", tokyo.palette.purple, tokyo.palette.none, "bold")
tokyo.hi("htmlLink", tokyo.palette.none, tokyo.palette.none, "underline")
tokyo.hi("htmlBold", tokyo.palette.none, tokyo.palette.none, "bold")
tokyo.hi("htmlBoldUnderline", tokyo.palette.none, tokyo.palette.none, "bold,underline")
tokyo.hi("htmlBoldItalic", tokyo.palette.none, tokyo.palette.none, "bold,italic")
tokyo.hi("htmlBoldUnderlineItalic", tokyo.palette.none, tokyo.palette.none, "bold,underline,italic")
tokyo.hi("htmlUnderline", tokyo.palette.none, tokyo.palette.none, "underline")
tokyo.hi("htmlUnderlineItalic", tokyo.palette.none, tokyo.palette.none, "underline,italic")
tokyo.hi("htmlItalic", tokyo.palette.none, tokyo.palette.none, "italic")
tokyo.link "htmlTag Green"
tokyo.link "htmlEndTag Blue"
tokyo.link "htmlTagN RedItalic"
tokyo.link "htmlTagName RedItalic"
tokyo.link "htmlArg Blue"
tokyo.link "htmlScriptTag Purple"
tokyo.link "htmlSpecialTagName RedItalic"
tokyo.link "htmlString Green"
-- }}}
-- }}}
-- Xml: {{{
-- builtin: http//github.com/chrisbra/vim-xml-ftplugin{{{
tokyo.link "xmlTag Green"
tokyo.link "xmlEndTag Blue"
tokyo.link "xmlTagName RedItalic"
tokyo.link "xmlEqual Orange"
tokyo.link "xmlAttrib Blue"
tokyo.link "xmlEntity Red"
tokyo.link "xmlEntityPunct Red"
tokyo.link "xmlDocTypeDecl Grey"
tokyo.link "xmlDocTypeKeyword RedItalic"
tokyo.link "xmlCdataStart Grey"
tokyo.link "xmlCdataCdata Purple"
tokyo.link "xmlString Green"
-- }}}
-- }}}
-- CS {{{
-- builtin: http//github.com/JulesWang/css.vim{{{
tokyo.link "cssStringQ Green"
tokyo.link "cssStringQQ Green"
tokyo.link "cssAttrComma Grey"
tokyo.link "cssBraces Grey"
tokyo.link "cssTagName Purple"
tokyo.link "cssClassNameDot Orange"
tokyo.link "cssClassName Red"
tokyo.link "cssFunctionName Orange"
tokyo.link "cssAttr Green"
tokyo.link "cssCommonAttr Green"
tokyo.link "cssProp Blue"
tokyo.link "cssPseudoClassId Yellow"
tokyo.link "cssPseudoClassFn Green"
tokyo.link "cssPseudoClass Yellow"
tokyo.link "cssImportant Red"
tokyo.link "cssSelectorOp Orange"
tokyo.link "cssSelectorOp2 Orange"
tokyo.link "cssColor Green"
tokyo.link "cssUnitDecorators Orange"
tokyo.link "cssValueLength Green"
tokyo.link "cssValueInteger Green"
tokyo.link "cssValueNumber Green"
tokyo.link "cssValueAngle Green"
tokyo.link "cssValueTime Green"
tokyo.link "cssValueFrequency Green"
tokyo.link "cssVendor Grey"
tokyo.link "cssNoise Grey"
-- }}}
-- }}}
-- SAS {{{
-- scss-syntax: http//github.com/cakebaker/scss-syntax.vim{{{
tokyo.link "scssMixinName Orange"
tokyo.link "scssSelectorChar Orange"
tokyo.link "scssSelectorName Red"
tokyo.link "scssInterpolationDelimiter Yellow"
tokyo.link "scssVariableValue Green"
tokyo.link "scssNull Purple"
tokyo.link "scssBoolean Purple"
tokyo.link "scssVariableAssignment Grey"
tokyo.link "scssAttribute Green"
tokyo.link "scssFunctionName Orange"
tokyo.link "scssVariable Fg"
tokyo.link "scssAmpersand Purple"
-- }}}
-- }}}
-- LES {{{
-- vim-les http//github.com/groenewege/vim-less{{{
tokyo.link "lessMixinChar Grey"
tokyo.link "lessClass Red"
tokyo.link "lessFunction Orange"
-- }}}
-- }}}
-- JavaScript: {{{
-- builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
tokyo.link "javaScriptNull OrangeItalic"
tokyo.link "javaScriptIdentifier BlueItalic"
tokyo.link "javaScriptParens Fg"
tokyo.link "javaScriptBraces Fg"
tokyo.link "javaScriptNumber Purple"
tokyo.link "javaScriptLabel Red"
tokyo.link "javaScriptGlobal BlueItalic"
tokyo.link "javaScriptMessage BlueItalic"
-- }}}
-- vim-javascript: http//github.com/pangloss/vim-javascript{{{
tokyo.link "jsNoise Fg"
tokyo.link "Noise Fg"
tokyo.link "jsParens Fg"
tokyo.link "jsBrackets Fg"
tokyo.link "jsObjectBraces Fg"
tokyo.link "jsThis BlueItalic"
tokyo.link "jsUndefined OrangeItalic"
tokyo.link "jsNull OrangeItalic"
tokyo.link "jsNan OrangeItalic"
tokyo.link "jsSuper OrangeItalic"
tokyo.link "jsPrototype OrangeItalic"
tokyo.link "jsFunction Red"
tokyo.link "jsGlobalNodeObjects BlueItalic"
tokyo.link "jsGlobalObjects BlueItalic"
tokyo.link "jsArrowFunction Red"
tokyo.link "jsArrowFuncArgs Fg"
tokyo.link "jsFuncArgs Fg"
tokyo.link "jsObjectProp Fg"
tokyo.link "jsVariableDef Fg"
tokyo.link "jsObjectKey Fg"
tokyo.link "jsParen Fg"
tokyo.link "jsParenIfElse Fg"
tokyo.link "jsParenRepeat Fg"
tokyo.link "jsParenSwitch Fg"
tokyo.link "jsParenCatch Fg"
tokyo.link "jsBracket Fg"
tokyo.link "jsObjectValue Fg"
tokyo.link "jsDestructuringBlock Fg"
tokyo.link "jsBlockLabel Purple"
tokyo.link "jsFunctionKey Green"
tokyo.link "jsClassDefinition BlueItalic"
tokyo.link "jsDot Orange"
tokyo.link "jsSpreadExpression Purple"
tokyo.link "jsSpreadOperator Green"
tokyo.link "jsModuleKeyword BlueItalic"
tokyo.link "jsTemplateExpression Purple"
tokyo.link "jsTemplateBraces Purple"
tokyo.link "jsClassMethodType BlueItalic"
tokyo.link "jsExceptions BlueItalic"
-- }}}
-- yaj http//github.com/othree/yajs.vim{{{
tokyo.link "javascriptOpSymbol Red"
tokyo.link "javascriptOpSymbols Red"
tokyo.link "javascriptIdentifierName Fg"
tokyo.link "javascriptVariable BlueItalic"
tokyo.link "javascriptObjectLabel Fg"
tokyo.link "javascriptPropertyNameString Fg"
tokyo.link "javascriptFuncArg Fg"
tokyo.link "javascriptObjectLiteral Green"
tokyo.link "javascriptIdentifier OrangeItalic"
tokyo.link "javascriptArrowFunc Red"
tokyo.link "javascriptTemplate Purple"
tokyo.link "javascriptTemplateSubstitution Purple"
tokyo.link "javascriptTemplateSB Purple"
tokyo.link "javascriptNodeGlobal BlueItalic"
tokyo.link "javascriptDocTags RedItalic"
tokyo.link "javascriptDocNotation Blue"
tokyo.link "javascriptClassSuper OrangeItalic"
tokyo.link "javascriptClassName BlueItalic"
tokyo.link "javascriptClassSuperName BlueItalic"
tokyo.link "javascriptOperator Red"
tokyo.link "javascriptBrackets Fg"
tokyo.link "javascriptBraces Fg"
tokyo.link "javascriptLabel Purple"
tokyo.link "javascriptEndColons Grey"
tokyo.link "javascriptObjectLabelColon Grey"
tokyo.link "javascriptDotNotation Orange"
tokyo.link "javascriptGlobalArrayDot Orange"
tokyo.link "javascriptGlobalBigIntDot Orange"
tokyo.link "javascriptGlobalDateDot Orange"
tokyo.link "javascriptGlobalJSONDot Orange"
tokyo.link "javascriptGlobalMathDot Orange"
tokyo.link "javascriptGlobalNumberDot Orange"
tokyo.link "javascriptGlobalObjectDot Orange"
tokyo.link "javascriptGlobalPromiseDot Orange"
tokyo.link "javascriptGlobalRegExpDot Orange"
tokyo.link "javascriptGlobalStringDot Orange"
tokyo.link "javascriptGlobalSymbolDot Orange"
tokyo.link "javascriptGlobalURLDot Orange"
tokyo.link "javascriptMethod Green"
tokyo.link "javascriptMethodName Green"
tokyo.link "javascriptObjectMethodName Green"
tokyo.link "javascriptGlobalMethod Green"
tokyo.link "javascriptDOMStorageMethod Green"
tokyo.link "javascriptFileMethod Green"
tokyo.link "javascriptFileReaderMethod Green"
tokyo.link "javascriptFileListMethod Green"
tokyo.link "javascriptBlobMethod Green"
tokyo.link "javascriptURLStaticMethod Green"
tokyo.link "javascriptNumberStaticMethod Green"
tokyo.link "javascriptNumberMethod Green"
tokyo.link "javascriptDOMNodeMethod Green"
tokyo.link "javascriptES6BigIntStaticMethod Green"
tokyo.link "javascriptBOMWindowMethod Green"
tokyo.link "javascriptHeadersMethod Green"
tokyo.link "javascriptRequestMethod Green"
tokyo.link "javascriptResponseMethod Green"
tokyo.link "javascriptES6SetMethod Green"
tokyo.link "javascriptReflectMethod Green"
tokyo.link "javascriptPaymentMethod Green"
tokyo.link "javascriptPaymentResponseMethod Green"
tokyo.link "javascriptTypedArrayStaticMethod Green"
tokyo.link "javascriptGeolocationMethod Green"
tokyo.link "javascriptES6MapMethod Green"
tokyo.link "javascriptServiceWorkerMethod Green"
tokyo.link "javascriptCacheMethod Green"
tokyo.link "javascriptFunctionMethod Green"
tokyo.link "javascriptXHRMethod Green"
tokyo.link "javascriptBOMNavigatorMethod Green"
tokyo.link "javascriptServiceWorkerMethod Green"
tokyo.link "javascriptDOMEventTargetMethod Green"
tokyo.link "javascriptDOMEventMethod Green"
tokyo.link "javascriptIntlMethod Green"
tokyo.link "javascriptDOMDocMethod Green"
tokyo.link "javascriptStringStaticMethod Green"
tokyo.link "javascriptStringMethod Green"
tokyo.link "javascriptSymbolStaticMethod Green"
tokyo.link "javascriptRegExpMethod Green"
tokyo.link "javascriptObjectStaticMethod Green"
tokyo.link "javascriptObjectMethod Green"
tokyo.link "javascriptBOMLocationMethod Green"
tokyo.link "javascriptJSONStaticMethod Green"
tokyo.link "javascriptGeneratorMethod Green"
tokyo.link "javascriptEncodingMethod Green"
tokyo.link "javascriptPromiseStaticMethod Green"
tokyo.link "javascriptPromiseMethod Green"
tokyo.link "javascriptBOMHistoryMethod Green"
tokyo.link "javascriptDOMFormMethod Green"
tokyo.link "javascriptClipboardMethod Green"
tokyo.link "javascriptTypedArrayStaticMethod Green"
tokyo.link "javascriptBroadcastMethod Green"
tokyo.link "javascriptDateStaticMethod Green"
tokyo.link "javascriptDateMethod Green"
tokyo.link "javascriptConsoleMethod Green"
tokyo.link "javascriptArrayStaticMethod Green"
tokyo.link "javascriptArrayMethod Green"
tokyo.link "javascriptMathStaticMethod Green"
tokyo.link "javascriptSubtleCryptoMethod Green"
tokyo.link "javascriptCryptoMethod Green"
tokyo.link "javascriptProp Fg"
tokyo.link "javascriptBOMWindowProp Fg"
tokyo.link "javascriptDOMStorageProp Fg"
tokyo.link "javascriptFileReaderProp Fg"
tokyo.link "javascriptURLUtilsProp Fg"
tokyo.link "javascriptNumberStaticProp Fg"
tokyo.link "javascriptDOMNodeProp Fg"
tokyo.link "javascriptRequestProp Fg"
tokyo.link "javascriptResponseProp Fg"
tokyo.link "javascriptES6SetProp Fg"
tokyo.link "javascriptPaymentProp Fg"
tokyo.link "javascriptPaymentResponseProp Fg"
tokyo.link "javascriptPaymentAddressProp Fg"
tokyo.link "javascriptPaymentShippingOptionProp Fg"
tokyo.link "javascriptTypedArrayStaticProp Fg"
tokyo.link "javascriptServiceWorkerProp Fg"
tokyo.link "javascriptES6MapProp Fg"
tokyo.link "javascriptRegExpStaticProp Fg"
tokyo.link "javascriptRegExpProp Fg"
tokyo.link "javascriptXHRProp Fg"
tokyo.link "javascriptBOMNavigatorProp Green"
tokyo.link "javascriptDOMEventProp Fg"
tokyo.link "javascriptBOMNetworkProp Fg"
tokyo.link "javascriptDOMDocProp Fg"
tokyo.link "javascriptSymbolStaticProp Fg"
tokyo.link "javascriptSymbolProp Fg"
tokyo.link "javascriptBOMLocationProp Fg"
tokyo.link "javascriptEncodingProp Fg"
tokyo.link "javascriptCryptoProp Fg"
tokyo.link "javascriptBOMHistoryProp Fg"
tokyo.link "javascriptDOMFormProp Fg"
tokyo.link "javascriptDataViewProp Fg"
tokyo.link "javascriptBroadcastProp Fg"
tokyo.link "javascriptMathStaticProp Fg"
-- }}}
-- }}}
-- JavaScript React: {{{
-- vim-jsx-pretty: http//github.com/maxmellon/vim-jsx-pretty{{{
tokyo.link "jsxTagName RedItalic"
tokyo.link "jsxOpenPunct Green"
tokyo.link "jsxClosePunct Blue"
tokyo.link "jsxEscapeJs Purple"
tokyo.link "jsxAttrib Blue"
-- }}}
-- }}}
-- TypeScript: {{{
-- vim-typescript: http//github.com/leafgarland/typescript-vim{{{
tokyo.link "typescriptStorageClass Red"
tokyo.link "typescriptEndColons Fg"
tokyo.link "typescriptSource BlueItalic"
tokyo.link "typescriptMessage Green"
tokyo.link "typescriptGlobalObjects BlueItalic"
tokyo.link "typescriptInterpolation Purple"
tokyo.link "typescriptInterpolationDelimiter Purple"
tokyo.link "typescriptBraces Fg"
tokyo.link "typescriptParens Fg"
-- }}}
-- yat httpgithub.com/HerringtonDarkholme/yats.vim{{{
tokyo.link "typescriptMethodAccessor Red"
tokyo.link "typescriptVariable Red"
tokyo.link "typescriptVariableDeclaration Fg"
tokyo.link "typescriptTypeReference BlueItalic"
tokyo.link "typescriptBraces Fg"
tokyo.link "typescriptEnumKeyword Red"
tokyo.link "typescriptEnum BlueItalic"
tokyo.link "typescriptIdentifierName Fg"
tokyo.link "typescriptProp Fg"
tokyo.link "typescriptCall Fg"
tokyo.link "typescriptInterfaceName BlueItalic"
tokyo.link "typescriptEndColons Fg"
tokyo.link "typescriptMember Fg"
tokyo.link "typescriptMemberOptionality Red"
tokyo.link "typescriptObjectLabel Fg"
tokyo.link "typescriptDefaultParam Fg"
tokyo.link "typescriptArrowFunc Red"
tokyo.link "typescriptAbstract Red"
tokyo.link "typescriptObjectColon Grey"
tokyo.link "typescriptTypeAnnotation Grey"
tokyo.link "typescriptAssign Red"
tokyo.link "typescriptBinaryOp Red"
tokyo.link "typescriptUnaryOp Red"
tokyo.link "typescriptFuncComma Fg"
tokyo.link "typescriptClassName BlueItalic"
tokyo.link "typescriptClassHeritage BlueItalic"
tokyo.link "typescriptInterfaceHeritage BlueItalic"
tokyo.link "typescriptIdentifier OrangeItalic"
tokyo.link "typescriptGlobal BlueItalic"
tokyo.link "typescriptOperator Red"
tokyo.link "typescriptNodeGlobal BlueItalic"
tokyo.link "typescriptExport Red"
tokyo.link "typescriptImport Red"
tokyo.link "typescriptTypeParameter BlueItalic"
tokyo.link "typescriptReadonlyModifier Red"
tokyo.link "typescriptAccessibilityModifier Red"
tokyo.link "typescriptAmbientDeclaration Red"
tokyo.link "typescriptTemplateSubstitution Purple"
tokyo.link "typescriptTemplateSB Purple"
tokyo.link "typescriptExceptions Red"
tokyo.link "typescriptCastKeyword Red"
tokyo.link "typescriptOptionalMark Red"
tokyo.link "typescriptNull OrangeItalic"
tokyo.link "typescriptMappedIn Red"
tokyo.link "typescriptFuncTypeArrow Red"
tokyo.link "typescriptTernaryOp Red"
tokyo.link "typescriptParenExp Fg"
tokyo.link "typescriptIndexExpr Fg"
tokyo.link "typescriptDotNotation Orange"
tokyo.link "typescriptGlobalNumberDot Orange"
tokyo.link "typescriptGlobalStringDot Orange"
tokyo.link "typescriptGlobalArrayDot Orange"
tokyo.link "typescriptGlobalObjectDot Orange"
tokyo.link "typescriptGlobalSymbolDot Orange"
tokyo.link "typescriptGlobalMathDot Orange"
tokyo.link "typescriptGlobalDateDot Orange"
tokyo.link "typescriptGlobalJSONDot Orange"
tokyo.link "typescriptGlobalRegExpDot Orange"
tokyo.link "typescriptGlobalPromiseDot Orange"
tokyo.link "typescriptGlobalURLDot Orange"
tokyo.link "typescriptGlobalMethod Green"
tokyo.link "typescriptDOMStorageMethod Green"
tokyo.link "typescriptFileMethod Green"
tokyo.link "typescriptFileReaderMethod Green"
tokyo.link "typescriptFileListMethod Green"
tokyo.link "typescriptBlobMethod Green"
tokyo.link "typescriptURLStaticMethod Green"
tokyo.link "typescriptNumberStaticMethod Green"
tokyo.link "typescriptNumberMethod Green"
tokyo.link "typescriptDOMNodeMethod Green"
tokyo.link "typescriptPaymentMethod Green"
tokyo.link "typescriptPaymentResponseMethod Green"
tokyo.link "typescriptHeadersMethod Green"
tokyo.link "typescriptRequestMethod Green"
tokyo.link "typescriptResponseMethod Green"
tokyo.link "typescriptES6SetMethod Green"
tokyo.link "typescriptReflectMethod Green"
tokyo.link "typescriptBOMWindowMethod Green"
tokyo.link "typescriptGeolocationMethod Green"
tokyo.link "typescriptServiceWorkerMethod Green"
tokyo.link "typescriptCacheMethod Green"
tokyo.link "typescriptES6MapMethod Green"
tokyo.link "typescriptFunctionMethod Green"
tokyo.link "typescriptRegExpMethod Green"
tokyo.link "typescriptXHRMethod Green"
tokyo.link "typescriptBOMNavigatorMethod Green"
tokyo.link "typescriptServiceWorkerMethod Green"
tokyo.link "typescriptIntlMethod Green"
tokyo.link "typescriptDOMEventTargetMethod Green"
tokyo.link "typescriptDOMEventMethod Green"
tokyo.link "typescriptDOMDocMethod Green"
tokyo.link "typescriptStringStaticMethod Green"
tokyo.link "typescriptStringMethod Green"
tokyo.link "typescriptSymbolStaticMethod Green"
tokyo.link "typescriptObjectStaticMethod Green"
tokyo.link "typescriptObjectMethod Green"
tokyo.link "typescriptJSONStaticMethod Green"
tokyo.link "typescriptEncodingMethod Green"
tokyo.link "typescriptBOMLocationMethod Green"
tokyo.link "typescriptPromiseStaticMethod Green"
tokyo.link "typescriptPromiseMethod Green"
tokyo.link "typescriptSubtleCryptoMethod Green"
tokyo.link "typescriptCryptoMethod Green"
tokyo.link "typescriptBOMHistoryMethod Green"
tokyo.link "typescriptDOMFormMethod Green"
tokyo.link "typescriptConsoleMethod Green"
tokyo.link "typescriptDateStaticMethod Green"
tokyo.link "typescriptDateMethod Green"
tokyo.link "typescriptArrayStaticMethod Green"
tokyo.link "typescriptArrayMethod Green"
tokyo.link "typescriptMathStaticMethod Green"
tokyo.link "typescriptStringProperty Fg"
tokyo.link "typescriptDOMStorageProp Fg"
tokyo.link "typescriptFileReaderProp Fg"
tokyo.link "typescriptURLUtilsProp Fg"
tokyo.link "typescriptNumberStaticProp Fg"
tokyo.link "typescriptDOMNodeProp Fg"
tokyo.link "typescriptBOMWindowProp Fg"
tokyo.link "typescriptRequestProp Fg"
tokyo.link "typescriptResponseProp Fg"
tokyo.link "typescriptPaymentProp Fg"
tokyo.link "typescriptPaymentResponseProp Fg"
tokyo.link "typescriptPaymentAddressProp Fg"
tokyo.link "typescriptPaymentShippingOptionProp Fg"
tokyo.link "typescriptES6SetProp Fg"
tokyo.link "typescriptServiceWorkerProp Fg"
tokyo.link "typescriptES6MapProp Fg"
tokyo.link "typescriptRegExpStaticProp Fg"
tokyo.link "typescriptRegExpProp Fg"
tokyo.link "typescriptBOMNavigatorProp Green"
tokyo.link "typescriptXHRProp Fg"
tokyo.link "typescriptDOMEventProp Fg"
tokyo.link "typescriptDOMDocProp Fg"
tokyo.link "typescriptBOMNetworkProp Fg"
tokyo.link "typescriptSymbolStaticProp Fg"
tokyo.link "typescriptEncodingProp Fg"
tokyo.link "typescriptBOMLocationProp Fg"
tokyo.link "typescriptCryptoProp Fg"
tokyo.link "typescriptDOMFormProp Fg"
tokyo.link "typescriptBOMHistoryProp Fg"
tokyo.link "typescriptMathStaticProp Fg"
-- }}}
-- }}}
-- Dart: {{{
-- dart-lang: http//github.com/dart-lang/dart-vim-plugin{{{
tokyo.link "dartCoreClasses BlueItalic"
tokyo.link "dartTypeName BlueItalic"
tokyo.link "dartInterpolation Purple"
tokyo.link "dartTypeDef Red"
tokyo.link "dartClassDecl Red"
tokyo.link "dartLibrary Red"
tokyo.link "dartMetadata OrangeItalic"
-- }}}
-- }}}
-- C/C++: {{{
-- vim-cpp-enhanced-highlight: http//github.com/octol/vim-cpp-enhanced-highlight{{{
tokyo.link "cLabel Red"
tokyo.link "cppSTLnamespace BlueItalic"
tokyo.link "cppSTLtype BlueItalic"
tokyo.link "cppAccess Red"
tokyo.link "cppStructure Red"
tokyo.link "cppSTLios BlueItalic"
tokyo.link "cppSTLiterator BlueItalic"
tokyo.link "cppSTLexception Red"
-- }}}
-- vim-cpp-modern: http//github.com/bfrg/vim-cpp-modern{{{
tokyo.link "cppSTLVariable BlueItalic"
-- }}}
-- chromatica: http//github.com/arakashic/chromatica.nvim{{{
tokyo.link "Member OrangeItalic"
tokyo.link "Variable Fg"
tokyo.link "Namespace BlueItalic"
tokyo.link "EnumConstant OrangeItalic"
tokyo.link "chromaticaException Red"
tokyo.link "chromaticaCast Red"
tokyo.link "OperatorOverload Red"
tokyo.link "AccessQual Red"
tokyo.link "Linkage Red"
tokyo.link "AutoType BlueItalic"
-- }}}
-- vim-lsp-cxx-highlight http//github.com/jackguo380/vim-lsp-cxx-highlight{{{
tokyo.link "LspCxxHlSkippedRegion Grey"
tokyo.link "LspCxxHlSkippedRegionBeginEnd Red"
tokyo.link "LspCxxHlGroupEnumConstant OrangeItalic"
tokyo.link "LspCxxHlGroupNamespace BlueItalic"
tokyo.link "LspCxxHlGroupMemberVariable OrangeItalic"
-- }}}
-- }}}
-- ObjectiveC: {{{
-- builtin: {{{
tokyo.link "objcModuleImport Red"
tokyo.link "objcException Red"
tokyo.link "objcProtocolList Fg"
tokyo.link "objcDirective Red"
tokyo.link "objcPropertyAttribute Purple"
tokyo.link "objcHiddenArgument Fg"
-- }}}
-- }}}
-- C#: {{{
-- builtin: http//github.com/nickspoons/vim-cs{{{
tokyo.link "csUnspecifiedStatement Red"
tokyo.link "csStorage Red"
tokyo.link "csClass Red"
tokyo.link "csNewType BlueItalic"
tokyo.link "csContextualStatement Red"
tokyo.link "csInterpolationDelimiter Purple"
tokyo.link "csInterpolation Purple"
tokyo.link "csEndColon Fg"
-- }}}
-- }}}
-- Python: {{{
-- builtin: {{{
tokyo.link "pythonBuiltin BlueItalic"
tokyo.link "pythonExceptions Red"
tokyo.link "pythonDecoratorName OrangeItalic"
-- }}}
-- python-syntax: http//github.com/vim-python/python-syntax{{{
tokyo.link "pythonExClass BlueItalic"
tokyo.link "pythonBuiltinType BlueItalic"
tokyo.link "pythonBuiltinObj OrangeItalic"
tokyo.link "pythonDottedName OrangeItalic"
tokyo.link "pythonBuiltinFunc Green"
tokyo.link "pythonFunction Green"
tokyo.link "pythonDecorator OrangeItalic"
tokyo.link "pythonInclude Include"
tokyo.link "pythonImport PreProc"
tokyo.link "pythonOperator Red"
tokyo.link "pythonConditional Red"
tokyo.link "pythonRepeat Red"
tokyo.link "pythonException Red"
tokyo.link "pythonNone OrangeItalic"
tokyo.link "pythonCoding Grey"
tokyo.link "pythonDot Grey"
-- }}}
-- semshi: http//github.com/numirias/semshi{{{
tokyo.hi("semshiUnresolved", tokyo.palette.orange, tokyo.palette.none, "undercurl")
tokyo.link "semshiImported BlueItalic"
tokyo.link "semshiParameter OrangeItalic"
tokyo.link "semshiParameterUnused Grey"
tokyo.link "semshiSelf BlueItalic"
tokyo.link "semshiGlobal Green"
tokyo.link "semshiBuiltin Green"
tokyo.link "semshiAttribute OrangeItalic"
tokyo.link "semshiLocal Red"
tokyo.link "semshiFree Red"
tokyo.link "semshiSelected CocHighlightText"
tokyo.link "semshiErrorSign ALEErrorSign"
tokyo.link "semshiErrorChar ALEErrorSign"
-- }}}
-- }}}
-- Lua: {{{
-- builtin: {{{
tokyo.link "luaFunc Green"
tokyo.link "luaFunction Red"
tokyo.link "luaTable Fg"
tokyo.link "luaIn Red"
-- }}}
-- vim-lua: http//github.com/tbastos/vim-lua{{{
tokyo.link "luaFuncCall Green"
tokyo.link "luaLocal Red"
tokyo.link "luaSpecialValue Green"
tokyo.link "luaBraces Fg"
tokyo.link "luaBuiltIn BlueItalic"
tokyo.link "luaNoise Grey"
tokyo.link "luaLabel Purple"
tokyo.link "luaFuncTable BlueItalic"
tokyo.link "luaFuncArgName Fg"
tokyo.link "luaEllipsis Red"
tokyo.link "luaDocTag Green"
-- }}}
-- }}}
-- Java: {{{
-- builtin: {{{
tokyo.link "javaClassDecl Red"
tokyo.link "javaMethodDecl Red"
tokyo.link "javaVarArg Fg"
tokyo.link "javaAnnotation Purple"
tokyo.link "javaUserLabel Purple"
tokyo.link "javaTypedef OrangeItalic"
tokyo.link "javaParen Fg"
tokyo.link "javaParen1 Fg"
tokyo.link "javaParen2 Fg"
tokyo.link "javaParen3 Fg"
tokyo.link "javaParen4 Fg"
tokyo.link "javaParen5 Fg"
-- }}}
-- }}}
-- Kotlin: {{{
-- kotlin-vim: http//github.com/udalov/kotlin-vim{{{
tokyo.link "ktSimpleInterpolation Purple"
tokyo.link "ktComplexInterpolation Purple"
tokyo.link "ktComplexInterpolationBrace Purple"
tokyo.link "ktStructure Red"
tokyo.link "ktKeyword OrangeItalic"
-- }}}
-- }}}
-- Scala: {{{
-- builtin: http//github.com/derekwyatt/vim-scala{{{
tokyo.link "scalaNameDefinition Fg"
tokyo.link "scalaInterpolationBoundary Purple"
tokyo.link "scalaInterpolation Purple"
tokyo.link "scalaTypeOperator Red"
tokyo.link "scalaOperator Red"
tokyo.link "scalaKeywordModifier Red"
-- }}}
-- }}}
-- Go: {{{
-- builtin: http//github.com/google/vim-ft-go{{{
tokyo.link "goDirective Red"
tokyo.link "goConstants OrangeItalic"
tokyo.link "goDeclType Red"
-- }}}
-- polyglot: {{{
tokyo.link "goPackage Red"
tokyo.link "goImport Red"
tokyo.link "goBuiltins Green"
tokyo.link "goPredefinedIdentifiers OrangeItalic"
tokyo.link "goVar Red"
-- }}}
-- }}}
-- Rust: {{{
-- builtin: http//github.com/rust-lang/rust.vim{{{
tokyo.link "rustStructure Red"
tokyo.link "rustIdentifier OrangeItalic"
tokyo.link "rustModPath BlueItalic"
tokyo.link "rustModPathSep Grey"
tokyo.link "rustSelf OrangeItalic"
tokyo.link "rustSuper OrangeItalic"
tokyo.link "rustDeriveTrait Purple"
tokyo.link "rustEnumVariant Purple"
tokyo.link "rustMacroVariable OrangeItalic"
tokyo.link "rustAssert Green"
tokyo.link "rustPanic Green"
tokyo.link "rustPubScopeCrate BlueItalic"
tokyo.link "rustAttribute Purple"
-- }}}
-- }}}
-- Swift: {{{
-- swift.vim: http//github.com/keith/swift.vim{{{
tokyo.link "swiftInterpolatedWrapper Purple"
tokyo.link "swiftInterpolatedString Purple"
tokyo.link "swiftProperty Fg"
tokyo.link "swiftTypeDeclaration Red"
tokyo.link "swiftClosureArgument OrangeItalic"
tokyo.link "swiftStructure Red"
-- }}}
-- }}}
-- PHP: {{{
-- builtin: http//jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
tokyo.link "phpVarSelector Fg"
tokyo.link "phpIdentifier Fg"
tokyo.link "phpDefine Green"
tokyo.link "phpStructure Red"
tokyo.link "phpSpecialFunction Green"
tokyo.link "phpInterpSimpleCurly Purple"
tokyo.link "phpComparison Red"
tokyo.link "phpMethodsVar Fg"
tokyo.link "phpInterpVarname Fg"
tokyo.link "phpMemberSelector Red"
tokyo.link "phpLabel Red"
-- }}}
-- php.vim: http//github.com/StanAngeloff/php.vim{{{
tokyo.link "phpParent Fg"
tokyo.link "phpNowDoc Yellow"
tokyo.link "phpFunction Green"
tokyo.link "phpMethod Green"
tokyo.link "phpClass BlueItalic"
tokyo.link "phpSuperglobals BlueItalic"
tokyo.link "phpNullValue OrangeItalic"
-- }}}
-- }}}
-- Ruby: {{{
-- builtin: http//github.com/vim-ruby/vim-ruby{{{
tokyo.link "rubyKeywordAsMethod Green"
tokyo.link "rubyInterpolation Purple"
tokyo.link "rubyInterpolationDelimiter Purple"
tokyo.link "rubyStringDelimiter Yellow"
tokyo.link "rubyBlockParameterList Fg"
tokyo.link "rubyDefine Red"
tokyo.link "rubyModuleName Red"
tokyo.link "rubyAccess Red"
tokyo.link "rubyMacro Red"
tokyo.link "rubySymbol Fg"
-- }}}
-- }}}
-- Haskell: {{{
-- haskell-vim: http//github.com/neovimhaskell/haskell-vim{{{
tokyo.link "haskellBrackets Fg"
tokyo.link "haskellIdentifier OrangeItalic"
tokyo.link "haskellDecl Red"
tokyo.link "haskellType BlueItalic"
tokyo.link "haskellDeclKeyword Red"
tokyo.link "haskellWhere Red"
tokyo.link "haskellDeriving Red"
tokyo.link "haskellForeignKeywords Red"
-- }}}
-- }}}
-- Perl: {{{
-- builtin: http//github.com/vim-perl/vim-perl{{{
tokyo.link "perlStatementPackage Red"
tokyo.link "perlStatementInclude Red"
tokyo.link "perlStatementStorage Red"
tokyo.link "perlStatementList Red"
tokyo.link "perlMatchStartEnd Red"
tokyo.link "perlVarSimpleMemberName Green"
tokyo.link "perlVarSimpleMember Fg"
tokyo.link "perlMethod Green"
tokyo.link "podVerbatimLine Green"
tokyo.link "podCmdText Yellow"
tokyo.link "perlVarPlain Fg"
tokyo.link "perlVarPlain2 Fg"
-- }}}
-- }}}
-- OCaml: {{{
-- builtin: http//github.com/rgrinberg/vim-ocaml{{{
tokyo.link "ocamlArrow Red"
tokyo.link "ocamlEqual Red"
tokyo.link "ocamlOperator Red"
tokyo.link "ocamlKeyChar Red"
tokyo.link "ocamlModPath Green"
tokyo.link "ocamlFullMod Green"
tokyo.link "ocamlModule BlueItalic"
tokyo.link "ocamlConstructor Orange"
tokyo.link "ocamlModParam Fg"
tokyo.link "ocamlModParam1 Fg"
tokyo.link "ocamlAnyVar Fg -- aqua"
tokyo.link "ocamlPpxEncl Red"
tokyo.link "ocamlPpxIdentifier Fg"
tokyo.link "ocamlSigEncl Red"
tokyo.link "ocamlModParam1 Fg"
-- }}}
-- }}}
-- Erlang: {{{
-- builtin: http//github.com/vim-erlang/vim-erlang-runtime{{{
tokyo.link "erlangAtom Fg"
tokyo.link "erlangVariable Fg"
tokyo.link "erlangLocalFuncRef Green"
tokyo.link "erlangLocalFuncCall Green"
tokyo.link "erlangGlobalFuncRef Green"
tokyo.link "erlangGlobalFuncCall Green"
tokyo.link "erlangAttribute BlueItalic"
tokyo.link "erlangPipe Red"
-- }}}
-- }}}
-- Elixir: {{{
-- vim-elixir: http//github.com/elixir-editors/vim-elixir{{{
tokyo.link "elixirStringDelimiter Yellow"
tokyo.link "elixirKeyword Red"
tokyo.link "elixirInterpolation Purple"
tokyo.link "elixirInterpolationDelimiter Purple"
tokyo.link "elixirSelf BlueItalic"
tokyo.link "elixirPseudoVariable OrangeItalic"
tokyo.link "elixirModuleDefine Red"
tokyo.link "elixirBlockDefinition Red"
tokyo.link "elixirDefine Red"
tokyo.link "elixirPrivateDefine Red"
tokyo.link "elixirGuard Red"
tokyo.link "elixirPrivateGuard Red"
tokyo.link "elixirProtocolDefine Red"
tokyo.link "elixirImplDefine Red"
tokyo.link "elixirRecordDefine Red"
tokyo.link "elixirPrivateRecordDefine Red"
tokyo.link "elixirMacroDefine Red"
tokyo.link "elixirPrivateMacroDefine Red"
tokyo.link "elixirDelegateDefine Red"
tokyo.link "elixirOverridableDefine Red"
tokyo.link "elixirExceptionDefine Red"
tokyo.link "elixirCallbackDefine Red"
tokyo.link "elixirStructDefine Red"
tokyo.link "elixirExUnitMacro Red"
-- }}}
-- }}}
-- Common Lisp: {{{
-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
tokyo.link "lispAtomMark Purple"
tokyo.link "lispKey Orange"
tokyo.link "lispFunc Green"
-- }}}
-- }}}
-- Clojure: {{{
-- builtin: http//github.com/guns/vim-clojure-static{{{
tokyo.link "clojureMacro Red"
tokyo.link "clojureFunc Green"
tokyo.link "clojureConstant OrangeItalic"
tokyo.link "clojureSpecial Red"
tokyo.link "clojureDefine Red"
tokyo.link "clojureKeyword Blue"
tokyo.link "clojureVariable Fg"
tokyo.link "clojureMeta Purple"
tokyo.link "clojureDeref Purple"
-- }}}
-- }}}
-- Matlab: {{{
-- builtin: {{{
tokyo.link "matlabSemicolon Fg"
tokyo.link "matlabFunction RedItalic"
tokyo.link "matlabImplicit Green"
tokyo.link "matlabDelimiter Fg"
tokyo.link "matlabOperator Green"
tokyo.link "matlabArithmeticOperator Red"
tokyo.link "matlabArithmeticOperator Red"
tokyo.link "matlabRelationalOperator Red"
tokyo.link "matlabRelationalOperator Red"
tokyo.link "matlabLogicalOperator Red"
-- }}}
-- }}}
-- Shell: {{{
-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
tokyo.link "shRange Fg"
tokyo.link "shOption Purple"
tokyo.link "shQuote Yellow"
tokyo.link "shVariable BlueItalic"
tokyo.link "shDerefSimple BlueItalic"
tokyo.link "shDerefVar BlueItalic"
tokyo.link "shDerefSpecial BlueItalic"
tokyo.link "shDerefOff BlueItalic"
tokyo.link "shVarAssign Red"
tokyo.link "shFunctionOne Green"
tokyo.link "shFunctionKey Red"
-- }}}
-- }}}
-- Zsh: {{{
-- builtin: http//github.com/chrisbra/vim-zsh{{{
tokyo.link "zshOption BlueItalic"
tokyo.link "zshSubst Orange"
tokyo.link "zshFunction Green"
-- }}}
-- }}}
-- PowerShell: {{{
-- vim-ps1: http//github.com/PProvost/vim-ps1{{{
tokyo.link "ps1FunctionInvocation Green"
tokyo.link "ps1FunctionDeclaration Green"
tokyo.link "ps1InterpolationDelimiter Purple"
tokyo.link "ps1BuiltIn BlueItalic"
-- }}}
-- }}}
-- VimL: {{{
tokyo.link "vimLet Red"
tokyo.link "vimFunction Green"
tokyo.link "vimIsCommand Fg"
tokyo.link "vimUserFunc Green"
tokyo.link "vimFuncName Green"
tokyo.link "vimMap BlueItalic"
tokyo.link "vimNotation Purple"
tokyo.link "vimMapLhs Green"
tokyo.link "vimMapRhs Green"
tokyo.link "vimSetEqual BlueItalic"
tokyo.link "vimSetSep Fg"
tokyo.link "vimOption BlueItalic"
tokyo.link "vimUserAttrbKey BlueItalic"
tokyo.link "vimUserAttrb Green"
tokyo.link "vimAutoCmdSfxList Orange"
tokyo.link "vimSynType Orange"
tokyo.link "vimHiBang Orange"
tokyo.link "vimSet BlueItalic"
tokyo.link "vimSetSep Grey"
-- }}}
-- Makefile: {{{
tokyo.link "makeIdent Purple"
tokyo.link "makeSpecTarget BlueItalic"
tokyo.link "makeTarget Orange"
tokyo.link "makeCommands Red"
-- }}}
-- CMake: {{{
tokyo.link "cmakeCommand Red"
tokyo.link "cmakeKWconfigure_package_config_file BlueItalic"
tokyo.link "cmakeKWwrite_basic_package_version_file BlueItalic"
tokyo.link "cmakeKWExternalProject Green"
tokyo.link "cmakeKWadd_compile_definitions Green"
tokyo.link "cmakeKWadd_compile_options Green"
tokyo.link "cmakeKWadd_custom_command Green"
tokyo.link "cmakeKWadd_custom_target Green"
tokyo.link "cmakeKWadd_definitions Green"
tokyo.link "cmakeKWadd_dependencies Green"
tokyo.link "cmakeKWadd_executable Green"
tokyo.link "cmakeKWadd_library Green"
tokyo.link "cmakeKWadd_link_options Green"
tokyo.link "cmakeKWadd_subdirectory Green"
tokyo.link "cmakeKWadd_test Green"
tokyo.link "cmakeKWbuild_command Green"
tokyo.link "cmakeKWcmake_host_system_information Green"
tokyo.link "cmakeKWcmake_minimum_required Green"
tokyo.link "cmakeKWcmake_parse_arguments Green"
tokyo.link "cmakeKWcmake_policy Green"
tokyo.link "cmakeKWconfigure_file Green"
tokyo.link "cmakeKWcreate_test_sourcelist Green"
tokyo.link "cmakeKWctest_build Green"
tokyo.link "cmakeKWctest_configure Green"
tokyo.link "cmakeKWctest_coverage Green"
tokyo.link "cmakeKWctest_memcheck Green"
tokyo.link "cmakeKWctest_run_script Green"
tokyo.link "cmakeKWctest_start Green"
tokyo.link "cmakeKWctest_submit Green"
tokyo.link "cmakeKWctest_test Green"
tokyo.link "cmakeKWctest_update Green"
tokyo.link "cmakeKWctest_upload Green"
tokyo.link "cmakeKWdefine_property Green"
tokyo.link "cmakeKWdoxygen_add_docs Green"
tokyo.link "cmakeKWenable_language Green"
tokyo.link "cmakeKWenable_testing Green"
tokyo.link "cmakeKWexec_program Green"
tokyo.link "cmakeKWexecute_process Green"
tokyo.link "cmakeKWexport Green"
tokyo.link "cmakeKWexport_library_dependencies Green"
tokyo.link "cmakeKWfile Green"
tokyo.link "cmakeKWfind_file Green"
tokyo.link "cmakeKWfind_library Green"
tokyo.link "cmakeKWfind_package Green"
tokyo.link "cmakeKWfind_path Green"
tokyo.link "cmakeKWfind_program Green"
tokyo.link "cmakeKWfltk_wrap_ui Green"
tokyo.link "cmakeKWforeach Green"
tokyo.link "cmakeKWfunction Green"
tokyo.link "cmakeKWget_cmake_property Green"
tokyo.link "cmakeKWget_directory_property Green"
tokyo.link "cmakeKWget_filename_component Green"
tokyo.link "cmakeKWget_property Green"
tokyo.link "cmakeKWget_source_file_property Green"
tokyo.link "cmakeKWget_target_property Green"
tokyo.link "cmakeKWget_test_property Green"
tokyo.link "cmakeKWif Green"
tokyo.link "cmakeKWinclude Green"
tokyo.link "cmakeKWinclude_directories Green"
tokyo.link "cmakeKWinclude_external_msproject Green"
tokyo.link "cmakeKWinclude_guard Green"
tokyo.link "cmakeKWinstall Green"
tokyo.link "cmakeKWinstall_files Green"
tokyo.link "cmakeKWinstall_programs Green"
tokyo.link "cmakeKWinstall_targets Green"
tokyo.link "cmakeKWlink_directories Green"
tokyo.link "cmakeKWlist Green"
tokyo.link "cmakeKWload_cache Green"
tokyo.link "cmakeKWload_command Green"
tokyo.link "cmakeKWmacro Green"
tokyo.link "cmakeKWmark_as_advanced Green"
tokyo.link "cmakeKWmath Green"
tokyo.link "cmakeKWmessage Green"
tokyo.link "cmakeKWoption Green"
tokyo.link "cmakeKWproject Green"
tokyo.link "cmakeKWqt_wrap_cpp Green"
tokyo.link "cmakeKWqt_wrap_ui Green"
tokyo.link "cmakeKWremove Green"
tokyo.link "cmakeKWseparate_arguments Green"
tokyo.link "cmakeKWset Green"
tokyo.link "cmakeKWset_directory_properties Green"
tokyo.link "cmakeKWset_property Green"
tokyo.link "cmakeKWset_source_files_properties Green"
tokyo.link "cmakeKWset_target_properties Green"
tokyo.link "cmakeKWset_tests_properties Green"
tokyo.link "cmakeKWsource_group Green"
tokyo.link "cmakeKWstring Green"
tokyo.link "cmakeKWsubdirs Green"
tokyo.link "cmakeKWtarget_compile_definitions Green"
tokyo.link "cmakeKWtarget_compile_features Green"
tokyo.link "cmakeKWtarget_compile_options Green"
tokyo.link "cmakeKWtarget_include_directories Green"
tokyo.link "cmakeKWtarget_link_directories Green"
tokyo.link "cmakeKWtarget_link_libraries Green"
tokyo.link "cmakeKWtarget_link_options Green"
tokyo.link "cmakeKWtarget_precompile_headers Green"
tokyo.link "cmakeKWtarget_sources Green"
tokyo.link "cmakeKWtry_compile Green"
tokyo.link "cmakeKWtry_run Green"
tokyo.link "cmakeKWunset Green"
tokyo.link "cmakeKWuse_mangled_mesa Green"
tokyo.link "cmakeKWvariable_requires Green"
tokyo.link "cmakeKWvariable_watch Green"
tokyo.link "cmakeKWwrite_file Green"
-- }}}
-- Json: {{{
tokyo.link "jsonKeyword Red"
tokyo.link "jsonString Green"
tokyo.link "jsonBoolean Blue"
tokyo.link "jsonNoise Grey"
tokyo.link "jsonQuote Grey"
tokyo.link "jsonBraces Fg"
-- }}}
-- Yaml: {{{
tokyo.link "yamlKey Red"
tokyo.link "yamlConstant BlueItalic"
tokyo.link "yamlString Green"
-- }}}
-- Toml: {{{
tokyo.hi("tomlTable", tokyo.palette.purple, tokyo.palette.none, "bold")
tokyo.link "tomlKey Red"
tokyo.link "tomlBoolean Blue"
tokyo.link "tomlString Green"
tokyo.link "tomlTableArray tomlTable"
-- }}}
-- Diff: {{{
tokyo.link "diffAdded Green"
tokyo.link "diffRemoved Red"
tokyo.link "diffChanged Blue"
tokyo.link "diffOldFile Yellow"
tokyo.link "diffNewFile Orange"
tokyo.link "diffFile Purple"
tokyo.link "diffLine Grey"
tokyo.link "diffIndexLine Purple"
-- }}}
-- Git Commit: {{{
tokyo.link "gitcommitSummary Red"
tokyo.link "gitcommitUntracked Grey"
tokyo.link "gitcommitDiscarded Grey"
tokyo.link "gitcommitSelected Grey"
tokyo.link "gitcommitUnmerged Grey"
tokyo.link "gitcommitOnBranch Grey"
tokyo.link "gitcommitArrow Grey"
tokyo.link "gitcommitFile Green"
-- }}}
-- INI: {{{
tokyo.hi("dosiniHeader", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.link "dosiniLabel Blue"
tokyo.link "dosiniValue Green"
tokyo.link "dosiniNumber Green"
-- }}}
-- Help: {{{
tokyo.hi("helpNote", tokyo.palette.purple, tokyo.palette.none, "bold")
tokyo.hi("helpHeadline", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("helpHeader", tokyo.palette.orange, tokyo.palette.none, "bold")
tokyo.hi("helpURL", tokyo.palette.green, tokyo.palette.none, "underline")
tokyo.hi("helpHyperTextEntry", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.link "helpHyperTextJump Blue"
tokyo.link "helpCommand Yellow"
tokyo.link "helpExample Green"
tokyo.link "helpSpecial Purple"
tokyo.link "helpSectionDelim Grey"
-- }}}
-- }}}

-- Plugin {{{
-- junegunn/vim-plug{{{
tokyo.hi("plug1", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("plugNumber", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.link "plug2 Blue"
tokyo.link "plugBracket Blue"
tokyo.link "plugName Green"
tokyo.link "plugDash Red"
tokyo.link "plugNotLoaded Grey"
tokyo.link "plugH2 Purple"
tokyo.link "plugMessage Purple"
tokyo.link "plugError Red"
tokyo.link "plugRelDate Grey"
tokyo.link "plugStar Purple"
tokyo.link "plugUpdate Blue"
tokyo.link "plugDeleted Grey"
tokyo.link "plugEdge Purple"
-- }}}
-- neoclide/coc.nvim{{{
if current_word == "bold" then
tokyo.hi("CocHighlightText", tokyo.palette.none, tokyo.palette.none, "bold")
elseif current_word == "underline" then
tokyo.hi("CocHighlightText", tokyo.palette.none, tokyo.palette.none, "underline")
elseif current_word == "italic" then
tokyo.hi("CocHighlightText", tokyo.palette.none, tokyo.palette.none, "italic")
elseif current_word == "grey background" then
tokyo.hi("CocHighlightText", tokyo.palette.none, tokyo.palette.bg1)
end
tokyo.hi("CocHoverRange", tokyo.palette.none, tokyo.palette.none, "bold,underline")
tokyo.hi("CocHintHighlight", tokyo.palette.none, tokyo.palette.none, "undercurl", tokyo.palette.green)
tokyo.hi("CocErrorFloat", tokyo.palette.red, tokyo.palette.bg2)
tokyo.hi("CocWarningFloat", tokyo.palette.yellow, tokyo.palette.bg2)
tokyo.hi("CocInfoFloat", tokyo.palette.blue, tokyo.palette.bg2)
tokyo.hi("CocHintFloat", tokyo.palette.green, tokyo.palette.bg2)
tokyo.hi("CocHintSign", tokyo.palette.purple, tokyo.palette.bg1)
tokyo.link "CocCodeLens Grey"
tokyo.link "CocErrorSign ALEErrorSign"
tokyo.link "CocWarningSign ALEWarningSign"
tokyo.link "CocInfoSign ALEInfoSign"
tokyo.link "CocHintSign Label"
tokyo.link "CocErrorHighlight ALEError"
tokyo.link "CocWarningHighlight ALEWarning"
tokyo.link "CocInfoHighlight ALEInfo"
tokyo.link "CocWarningVirtualText ALEVirtualTextWarning"
tokyo.link "CocErrorVirtualText ALEVirtualTextError"
tokyo.link "CocInfoVirtualText ALEVirtualTextInfo"
tokyo.link "CocHintVirtualText ALEVirtualTextInfo"
tokyo.link "CocGitAddedSign GitGutterAdd"
tokyo.link "CocGitChangeRemovedSign GitGutterChangeDelete"
tokyo.link "CocGitChangedSign GitGutterChange"
tokyo.link "CocGitRemovedSign GitGutterDelete"
tokyo.link "CocGitTopRemovedSign GitGutterDelete"
tokyo.link "CocExplorerBufferRoot Red"
tokyo.link "CocExplorerBufferExpandIcon Blue"
tokyo.link "CocExplorerBufferBufnr Yellow"
tokyo.link "CocExplorerBufferModified Red"
tokyo.link "CocExplorerBufferBufname Grey"
tokyo.link "CocExplorerBufferFullpath Grey"
tokyo.link "CocExplorerFileRoot Red"
tokyo.link "CocExplorerFileExpandIcon Blue"
tokyo.link "CocExplorerFileFullpath Grey"
tokyo.link "CocExplorerFileDirectory Green"
tokyo.link "CocExplorerFileGitStage Blue"
tokyo.link "CocExplorerFileGitUnstage Yellow"
tokyo.link "CocExplorerFileSize Blue"
tokyo.link "CocExplorerTimeAccessed Purple"
tokyo.link "CocExplorerTimeCreated Purple"
tokyo.link "CocExplorerTimeModified Purple"
tokyo.link "CocExplorerFileRootName Orange"
tokyo.link "CocExplorerBufferNameVisible Green"
-- }}}
-- dense-analysis/ale{{{
tokyo.hi("ALEError", tokyo.palette.none, tokyo.palette.none, "undercurl", tokyo.palette.red)
tokyo.hi("ALEWarning", tokyo.palette.none, tokyo.palette.none, "undercurl", tokyo.palette.yellow)
tokyo.hi("ALEInfo", tokyo.palette.none, tokyo.palette.none, "undercurl", tokyo.palette.blue)
tokyo.hi("ALEErrorSign", tokyo.palette.red, tokyo.palette.bg1)
tokyo.hi("ALEWarningSign", tokyo.palette.yellow, tokyo.palette.bg1)
tokyo.hi("ALEInfoSign", tokyo.palette.blue, tokyo.palette.bg1)
tokyo.link "ALEVirtualTextError Grey"
tokyo.link "ALEVirtualTextWarning Grey"
tokyo.link "ALEVirtualTextInfo Grey"
tokyo.link "ALEVirtualTextStyleError ALEVirtualTextError"
tokyo.link "ALEVirtualTextStyleWarning ALEVirtualTextWarning"
-- }}}
-- neomake/neomake{{{
tokyo.link "NeomakeError ALEError"
tokyo.link "NeomakeErrorSign ALEErrorSign"
tokyo.link "NeomakeWarning ALEWarning"
tokyo.link "NeomakeWarningSign ALEWarningSign"
tokyo.link "NeomakeInfo ALEInfo"
tokyo.link "NeomakeInfoSign ALEInfoSign"
tokyo.link "NeomakeMessage ALEInfo"
tokyo.link "NeomakeMessageSign CocHintSign"
tokyo.link "NeomakeVirtualtextError Grey"
tokyo.link "NeomakeVirtualtextWarning Grey"
tokyo.link "NeomakeVirtualtextInfo Grey"
tokyo.link "NeomakeVirtualtextMessag Grey"
-- }}}
-- vim-syntastic/syntastic{{{
tokyo.link "SyntasticError ALEError"
tokyo.link "SyntasticWarning ALEWarning"
tokyo.link "SyntasticErrorSign ALEErrorSign"
tokyo.link "SyntasticWarningSign ALEWarningSign"
-- }}}
-- Yggdroot/LeaderF{{{
vim.g.Lf_StlColorscheme = "one"
tokyo.hi("Lf_hl_match", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_match0", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_match1", tokyo.palette.blue, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_match2", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_match3", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_match4", tokyo.palette.purple, tokyo.palette.none, "bold")
tokyo.hi("Lf_hl_matchRefine", tokyo.palette.yellow, tokyo.palette.none, "bold")
tokyo.link "Lf_hl_cursorline Fg"
tokyo.link "Lf_hl_selection DiffAdd"
tokyo.link "Lf_hl_rgHighlight Visual"
tokyo.link "Lf_hl_gtagsHighlight Visual"
-- }}}
-- Shougo/denite.nvim{{{
tokyo.hi("deniteMatchedChar", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("deniteMatchedRange", tokyo.palette.green, tokyo.palette.none, "bold,underline")
tokyo.hi("deniteInput", tokyo.palette.green, tokyo.palette.bg1, "bold")
tokyo.hi("deniteStatusLineNumber", tokyo.palette.purple, tokyo.palette.bg1)
tokyo.hi("deniteStatusLinePath", tokyo.palette.fg, tokyo.palette.bg1)
tokyo.link "deniteSelectedLine Green"
-- }}}
-- kien/ctrlp.vim{{{
tokyo.hi("CtrlPMatch", tokyo.palette.green, tokyo.palette.none, "bold")
tokyo.hi("CtrlPPrtBase", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("CtrlPLinePre", tokyo.palette.grey, tokyo.palette.none)
tokyo.hi("CtrlPMode1", tokyo.palette.blue, tokyo.palette.bg1, "bold")
tokyo.hi("CtrlPMode2", tokyo.palette.bg1, tokyo.palette.blue, "bold")
tokyo.hi("CtrlPStats", tokyo.palette.grey, tokyo.palette.bg1, "bold")
tokyo.link "CtrlPNoEntries Red"
tokyo.link "CtrlPPrtCursor Blue"
-- }}}
-- majutsushi/tagbar{{{
tokyo.link "TagbarFoldIcon Blue"
tokyo.link "TagbarSignature Green"
tokyo.link "TagbarKind Red"
tokyo.link "TagbarScope Orange"
tokyo.link "TagbarNestedKind Blue"
tokyo.link "TagbarVisibilityPrivate Red"
tokyo.link "TagbarVisibilityPublic Blue"
-- }}}
-- liuchengxu/vista.vim{{{
tokyo.link "VistaBracket Grey"
tokyo.link "VistaChildrenNr Yellow"
tokyo.link "VistaScope Red"
tokyo.link "VistaTag Green"
tokyo.link "VistaPrefix Grey"
tokyo.link "VistaColon Green"
tokyo.link "VistaIcon Purple"
tokyo.link "VistaLineNr Fg"
-- }}}
-- airblade/vim-gitgutter{{{
tokyo.hi("GitGutterAdd", tokyo.palette.green, tokyo.palette.bg1)
tokyo.hi("GitGutterChange", tokyo.palette.blue, tokyo.palette.bg1)
tokyo.hi("GitGutterDelete", tokyo.palette.red, tokyo.palette.bg1)
tokyo.hi("GitGutterChangeDelete", tokyo.palette.purple, tokyo.palette.bg1)
-- }}}
-- mhinz/vim-signify{{{
tokyo.link "SignifySignAdd GitGutterAdd"
tokyo.link "SignifySignChange GitGutterChange"
tokyo.link "SignifySignDelete GitGutterDelete"
tokyo.link "SignifySignChangeDelete GitGutterChangeDelete"
-- }}}
-- scrooloose/nerdtree{{{
tokyo.link "NERDTreeDir Green"
tokyo.link "NERDTreeDirSlash Green"
tokyo.link "NERDTreeOpenable Blue"
tokyo.link "NERDTreeClosable Blue"
tokyo.link "NERDTreeFile Fg"
tokyo.link "NERDTreeExecFile Red"
tokyo.link "NERDTreeUp Grey"
tokyo.link "NERDTreeCWD Purple"
tokyo.link "NERDTreeHelp Grey"
tokyo.link "NERDTreeToggleOn Green"
tokyo.link "NERDTreeToggleOff Red"
tokyo.link "NERDTreeFlags Blue"
tokyo.link "NERDTreeLinkFile Grey"
tokyo.link "NERDTreeLinkTarget Green"
-- }}}
-- justinmk/vim-dirvish{{{
tokyo.link "DirvishPathTail Blue"
tokyo.link "DirvishArg Yellow"
-- }}}
-- vim.org/netrw {{{
-- http//www.vim.org/scripts/script.php?script_id=1075
tokyo.link "netrwDir Green"
tokyo.link "netrwClassify Green"
tokyo.link "netrwLink Grey"
tokyo.link "netrwSymLink Fg"
tokyo.link "netrwExe Red"
tokyo.link "netrwComment Grey"
tokyo.link "netrwList Yellow"
tokyo.link "netrwHelpCmd Blue"
tokyo.link "netrwCmdSep Grey"
tokyo.link "netrwVersion Purple"
-- }}}
-- andymass/vim-matchup{{{
tokyo.hi("MatchParenCur", tokyo.palette.none, tokyo.palette.none, "bold")
tokyo.hi("MatchWord", tokyo.palette.none, tokyo.palette.none, "underline")
tokyo.hi("MatchWordCur", tokyo.palette.none, tokyo.palette.none, "underline")
-- }}}
-- easymotion/vim-easymotion {{{
tokyo.link "EasyMotionTarget Search"
tokyo.link "EasyMotionShade Grey"
-- }}}
-- justinmk/vim-sneak {{{
tokyo.link "Sneak Cursor"
tokyo.link "SneakLabel Cursor"
tokyo.link "SneakScope DiffAdd"
-- }}}
-- terryma/vim-multiple-cursors{{{
tokyo.link "multiple_cursors_cursor Cursor"
tokyo.link "multiple_cursors_visual Visual"
-- }}}
-- mg979/vim-visual-multi{{{
vim.g.VM_Mono_hl = "Cursor"
vim.g.VM_Extend_hl = "Visual"
vim.g.VM_Cursor_hl = "Cursor"
vim.g.VM_Insert_hl = "Cursor"
-- }}}
-- dominikduda/vim_current_word{{{
tokyo.link "CurrentWord CocHighlightText"
tokyo.link "CurrentWordTwins CocHighlightText"
-- }}}
-- RRethy/vim-illuminate{{{
tokyo.link "illuminatedWord CocHighlightText"
-- }}}
-- itchyny/vim-cursorword{{{
tokyo.link "CursorWord0 CocHighlightText"
tokyo.link "CursorWord1 CocHighlightText"
-- }}}
-- Yggdroot/indentLine{{{
vim.g.indentLine_color_gui = tokyo.palette.grey[0]
vim.g.indentLine_color_term = tokyo.palette.grey[1]
-- }}}
-- nathanaelkane/vim-indent-guides{{{
if vim.g.indent_guides_auto_colors == 0 then
tokyo.hi("IndentGuidesOdd", tokyo.palette.bg0, tokyo.palette.bg1)
tokyo.hi("IndentGuidesEven", tokyo.palette.bg0, tokyo.palette.bg2)
end
-- }}}
-- kshenoy/vim-signature {{{
tokyo.hi("SignatureMarkText", tokyo.palette.blue, tokyo.palette.bg1)
tokyo.hi("SignatureMarkerText", tokyo.palette.red, tokyo.palette.bg1)
-- }}}
-- mhinz/vim-startify{{{
tokyo.link "StartifyBracket Grey"
tokyo.link "StartifyFile Green"
tokyo.link "StartifyNumber Orange"
tokyo.link "StartifyPath Grey"
tokyo.link "StartifySlash Grey"
tokyo.link "StartifySection Blue"
tokyo.link "StartifyHeader Red"
tokyo.link "StartifySpecial Grey"
-- }}}
-- ap/vim-buftabline{{{
tokyo.link "BufTabLineCurrent TabLineSel"
tokyo.link "BufTabLineActive TabLine"
tokyo.link "BufTabLineHidden TabLineFill"
tokyo.link "BufTabLineFill TabLineFill"
-- }}}
-- liuchengxu/vim-which-key{{{
tokyo.link "WhichKey Red"
tokyo.link "WhichKeySeperator Green"
tokyo.link "WhichKeyGroup Orange"
tokyo.link "WhichKeyDesc Blue"
-- }}}
-- skywind3000/quickmenu.vim{{{
tokyo.link "QuickmenuOption Green"
tokyo.link "QuickmenuNumber Orange"
tokyo.link "QuickmenuBracket Grey"
tokyo.link "QuickmenuHelp Blue"
tokyo.link "QuickmenuSpecial Grey"
tokyo.link "QuickmenuHeader Purple"
-- }}}
-- mbbill/undotree{{{
tokyo.hi("UndotreeSavedBig", tokyo.palette.red, tokyo.palette.none, "bold")
tokyo.link "UndotreeNode Blue"
tokyo.link "UndotreeNodeCurrent Purple"
tokyo.link "UndotreeSeq Green"
tokyo.link "UndotreeCurrent Blue"
tokyo.link "UndotreeNext Yellow"
tokyo.link "UndotreeTimeStamp Grey"
tokyo.link "UndotreeHead Purple"
tokyo.link "UndotreeBranch Blue"
tokyo.link "UndotreeSavedSmall Red"
-- }}}
-- unblevable/quick-scope {{{
tokyo.hi("QuickScopePrimary", tokyo.palette.green, tokyo.palette.none, "underline")
tokyo.hi("QuickScopeSecondary", tokyo.palette.blue, tokyo.palette.none, "underline")
-- }}}
-- APZelos/blamer.nvim {{{
tokyo.link "Blamer Grey"
-- }}}
-- cohama/agit.vim {{{
tokyo.link "agitTree Grey"
tokyo.link "agitDate Green"
tokyo.link "agitRemote Red"
tokyo.link "agitHead Blue"
tokyo.link "agitRef Orange"
tokyo.link "agitTag Blue"
tokyo.link "agitStatFile Blue"
tokyo.link "agitStatRemoved Red"
tokyo.link "agitStatAdded Green"
tokyo.link "agitStatMessage Orange"
tokyo.link "agitDiffRemove diffRemoved"
tokyo.link "agitDiffAdd diffAdded"
tokyo.link "agitDiffHeader Blue"
tokyo.link "agitAuthor Yellow"
-- }}}
-- }}}

-- User defined {{{
tokyo.hi("Block", tokyo.palette.fg, tokyo.palette.bg3)
tokyo.hi("Inter", tokyo.palette.fg, tokyo.palette.bg1)
tokyo.hi("LightspeedGreyWash", tokyo.palette.grey)
-- }}}
