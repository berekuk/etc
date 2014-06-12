set runtimepath^=~/etc/vim

set nocompatible      " nobody cares about stupid classic vi
filetype off

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
Plugin 'perl-support.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-perl/vim-perl'
