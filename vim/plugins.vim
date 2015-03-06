" set the runtime path to include Vundle and initialize
set runtimepath+=~/etc/vim/bundle/Vundle.vim
call vundle#begin('~/etc/vim/bundle')
let g:vundle_default_git_proto = 'git'

Plugin 'gmarik/Vundle.vim'
Plugin 'closetag.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-perl/vim-perl'

Plugin 'godlygeek/tabular' " required by vim-markdown
Plugin 'plasticboy/vim-markdown'

Plugin 'rizzatti/dash.vim'

call vundle#end()
