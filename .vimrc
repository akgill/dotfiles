set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

colorscheme elflord

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" syntax highlighting and code linting for nearly all the things
Bundle 'scrooloose/syntastic'

" additional syntax highlighting plugins
Bundle 'honza/dockerfile.vim'
Bundle 'plasticboy/vim-markdown'

" python plugins
Bundle 'klen/python-mode'

" java code completion
Bundle 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on     " required!

let g:pymode_folding = 0
let g:pymode_lint_ignore = "W391"
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_run = 0

let g:pymode_rope_lookup_project = 1
let g:pymode_rope_goto_definition_bind = ''
let g:pymode_rope_goto_definition_cmd = 'e'

let python_highlight_all = 1

" Flake8 setup and shortcut
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=W391'

" Syntax checking on java files takes forever, so make it passive so syntax
" only checked on .java files when user issues ':SyntasticCheck' command
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }

" Set html, coffee, and javascript indent depths to 2-space.
autocmd FileType coffee,htm,html,xhtml,xml,php,javascript,mako setlocal shiftwidth=2 tabstop=2 softtabstop=2

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
