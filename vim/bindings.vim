" Easier to type than default '\'.
let mapleader = ","
let maplocalleader = ","

" Disable search highlight.
map <F2> :nohlsearch<CR>

" Toggle visibility of tabs and spaces.
map <F3> :set list!<CR>
" I switched off 'use all F* keys as standard function keys' setting on my Mac
" recently, so hitting F3 is now less convenient
map <Leader><Tab> :set list!<CR>

" Switch encoding.
" I rarely use it these days.
map <F5> :e ++enc=cp1251<CR>
map <F6> :e ++enc=utf-8<CR>
map <F7> :e ++enc=koi8-r<CR>

" Disable Ex mode - I never use it.
" See also: http://stackoverflow.com/questions/1269689/to-disable-entering-ex-mode-in-vim
map Q <Nop>

" toggle 'set paste'
set pastetoggle=<F8>

" delete all trailing spaces
nnoremap <Leader><Space> :%s/\s\+$//<CR>

" insert current date
nnoremap <Leader>d "=strftime("(%d %b %Y)")<CR>Pbb~f)a<CR><CR><Esc>k
" insert current time
nnoremap <Leader>t "=strftime("(%H:%M)")<CR>Pbb~f)a<CR><CR><Esc>k

" lookup using Dash.app
nnoremap <Leader>, :Dash<CR>

" command mode
cnoremap <C-a> <Home>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
