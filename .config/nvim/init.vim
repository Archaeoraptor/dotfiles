"use insert mode as default
startinsert

call plug#begin()
Plug 'https://github.com/h-hg/fcitx.nvim.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

if has('nvim')
    autocmd TermOpen term://* startinsert
endif

syntax on

"show row number
set number

""enable mouse
set mouse=a

"a very little ttimeoutlen value for fcitx
set ttimeoutlen=20
""do not compatiblie with vi 
set nocompatible

"auto read change from outside
set autoread

""clipboard setting
set clipboard=unnamedplus

" Search
set hlsearch

" Encoding setting
set encoding=utf-8

" use ctrl + space to switch input method
nnoremap <c-space>

lua require('plugins')
