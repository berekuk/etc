" Run current perl test.
autocmd Filetype perl nnoremap <LocalLeader>t :!prove -v %<CR>

" Search for perl modules in ./lib on 'gf'.
set path+=lib
