scriptencoding utf-8

" File:     fzf.vim
" Created:  25.11.2020
" Author:   Artyom Danilov (@defytheflow)

map <silent> <C-p> :execute system('git rev-parse --is-inside-work-tree') =~ 'true' ? 'GFiles' : 'Files' <CR>
nnoremap <silent> gb        :Buffers<CR>
nnoremap <silent> <leader>b :Buffers<CR>
