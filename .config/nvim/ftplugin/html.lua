-- HTML

-- indents
vim.o.shiftwidth = 2
vim.o.tabstop = 2

local boilerplate = [[
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='UTF-8'>
<title></title>
</head>

<body>
</body>
</html>
]]

vim.keymap.set('n', '!<CR>', 'i' .. boilerplate .. '<Esc>', {silent = true}) -- vscode
