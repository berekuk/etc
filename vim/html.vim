autocmd Filetype html,xml,xsl source ~/etc/vim/bundle/closetag.vim/plugin/closetag.vim
autocmd FileType html setlocal ts=2 sw=2 sts=2

" additional mappings for closetag.vim
inoremap <C-c> <C-R>=GetCloseTag()<CR>
map <C-c> a<C-_><ESC>
