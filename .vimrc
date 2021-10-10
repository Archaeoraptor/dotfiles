call plug#begin('~/.vim/plugged')
Plug 'https://github.com/lilydjwg/fcitx.vim'

call plug#end()


"synatx highlighting
syntax on
"show row number
set number

"enable mouse
set mouse=a

"a very little ttimeoutlen value for fcitx
set ttimeoutlen=20

"do not compatiblie with vi set nocompatible

"auto read change from outside
set autoread

"clipboard setting
set clipboard=unnamedplus
