" set the runtime path to include Vundle and initialize
set runtimepath+=~/etc/vim/bundle/Vundle.vim
call vundle#begin('~/etc/vim/bundle')
let g:vundle_default_git_proto = 'git'

Plugin 'gmarik/Vundle.vim'

Plugin 'closetag.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'vim-perl/vim-perl'
Plugin 'hynek/vim-python-pep8-indent'

Plugin 'godlygeek/tabular' " required by vim-markdown
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ["eslint"]

Plugin 'rizzatti/dash.vim'

Plugin 'chriskempson/base16-vim'

call vundle#end()
