"use insert mode as default
startinsert

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
Plug 'https://github.com/h-hg/fcitx.nvim.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'skywind3000/vim-terminal-help',Cond(!exists('g:vscode'))
Plug 'akinsho/toggleterm.nvim',Cond(!exists('g:vscode'))
Plug 'projekt0n/github-nvim-theme', Cond(!exists('g:vscode'))
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'))
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'))
Plug 'benknoble/vim-racket', Cond(!exists('g:vscode'))
Plug 'lervag/vimtex', Cond(!exists('g:vscode'))
Plug 'windwp/nvim-autopairs', Cond(!exists('g:vscode'))
" Plug 'neoclide/coc.nvim', {'branch': 'release'}, cond(!exists('g:vscode'))
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

" Leader 键设为空格
let mapleader = "\<space>"

" Coc插件配置
" 时间设为100ms
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" 减少无用的补全提示
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Coc插件使用tab自动补全
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车确认补全
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" 跳转到上一个/下一个错误
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 函数定义跳转
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 显示文档
" Use K to show documentation in preview window.
nnoremap <LEADER>h :call ShowDocumentation()<CR>

" Vim Script
if exists('g:vscode')
  " VSCode extension
else
  " ordinary neovim
  colorscheme github_light
  runtime vim.lua
  lua require('plugins')
endif

