"use insert mode as default
startinsert

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
Plug 'https://github.com/h-hg/fcitx.nvim.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'akinsho/toggleterm.nvim',Cond(!exists('g:vscode'))
Plug 'projekt0n/github-nvim-theme', Cond(!exists('g:vscode'))
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'))
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'))
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

" Vim Script
colorscheme github_light

lua require('plugins')
runtime vim.lua
