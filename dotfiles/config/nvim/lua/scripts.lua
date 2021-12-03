-- ╔═╗╔═╗╦═╗╦╔═╗╔╦╗╔═╗
-- ╚═╗║  ╠╦╝║╠═╝ ║ ╚═╗
-- ╚═╝╚═╝╩╚═╩╩   ╩ ╚═╝

-- TODO: replace this once we can define autocmd using lua

vim.cmd([[

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set nocursorline nocursorcolumn
augroup END

]])
