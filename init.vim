
"--------------
" plugins
"--------------
call plug#begin('~/.config/nvim/plugged')
  if has("nvim")
    " 编辑器功能
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'akinsho/bufferline.nvim'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'glepnir/indent-guides.nvim'
    Plug 'psliwka/vim-smoothie'
    "Plug 'nvim-lua/popup.nvim'
    Plug 'tpope/vim-fugitive'

    " 基础开发
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'

    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-lua/completion-nvim'

    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/lsp-colors.nvim'
    Plug 'nvim-lua/completion-nvim'

    " 配色
     Plug 'glepnir/zephyr-nvim'
  endif

call plug#end()

"--------------
" Settings
"--------------
set clipboard=unnamed          " 设置寄存器和系统剪切板通用
set noswapfile                 " 不生成缓冲文件
set nocompatible               " 不与Vi 兼容（采用Vim 自己的操作命令)
set backspace=indent,eol,start " 解决退格键失效的问题
set updatetime=100             " 刷新时间
set mouse=a                    " 支持使用鼠标
set hidden                     " Vim 会在切换 Buffer 的时候检测当前 Buffer 是否保存，如果还未保存，则会以打开一个新 Window 的形式打开另一个 Buffer

"--------------
" Filetype and Encoding
"--------------
" filetype on           " 识别文件类型
" filetype indent on    " 根据文件类型进行缩放
" filetype plugin on    " 根据文件类型载入插件

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

"--------------
" file encoding
"--------------
set encoding=utf-8
scriptencoding utf-8

"--------------
" key mapping
"--------------
let mapleader = ","


