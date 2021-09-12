"--------------
" plugins
"--------------
call plug#begin('~/.config/nvim/plugged')

  if has('nvim')

    " appearance
    Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'akinsho/bufferline.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " markdown
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'ttys3/nvim-blamer.lua'

    " editor
    Plug 'jiangmiao/auto-pairs'
    Plug 'mg979/vim-visual-multi'
    Plug 'tpope/vim-surround'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " termial
    Plug 'kassio/neoterm'

    " file-explorer
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

    " search
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    " colorscheme
    Plug 'tomasiser/vim-code-dark'

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
filetype on           " 识别文件类型
filetype indent on    " 根据文件类型进行缩放
filetype plugin on    " 根据文件类型载入插件


"--------------
" file encoding
"--------------
set encoding=utf-8
" scriptencoding utf-8

"--------------
" key mapping
"--------------
let mapleader = ','

