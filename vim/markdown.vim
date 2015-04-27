" .txt files are markdown by default.
autocmd BufNewFile,BufRead *.txt set filetype=mkd

let g:vim_markdown_folding_disabled=1

hi htmlBold cterm=bold ctermfg=white
hi htmlH1 ctermfg=4
hi htmlH2 ctermfg=2
