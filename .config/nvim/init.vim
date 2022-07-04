"use insert mode as default
startinsert

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
Plug 'https://github.com/h-hg/fcitx.nvim.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'skywind3000/vim-terminal-help',Cond(!exists('g:vscode'))
Plug 'akinsho/toggleterm.nvim',Cond(!exists('g:vscode'))
Plug 'projekt0n/github-nvim-theme', Cond(!exists('g:vscode'))
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'))
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'))
Plug 'benknoble/vim-racket', Cond(!exists('g:vscode'))
Plug 'lervag/vimtex', Cond(!exists('g:vscode'))
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

" set tab to 4 space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" use ctrl + space to switch input method
nnoremap <c-space>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Vim Script
if exists('g:vscode')
  " VSCode extension
else
  " ordinary neovim
  colorscheme github_light
  runtime vim.lua
  lua require('plugins')
endif

