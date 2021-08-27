
"--------------
" plugins
"--------------
call plug#begin('~/.config/nvim/plugged')
  if has("nvim")
    " 编辑器功能
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/bufferline.nvim'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kassio/neoterm'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'jiangmiao/auto-pairs'
    Plug 'editorconfig/editorconfig-vim'

    " git 增强
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " 基础开发
    Plug 'terryma/vim-multiple-cursors'

    " 文件管理
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

    " 搜索
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " 语法增强
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " 配色
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
scriptencoding utf-8

"--------------
" key mapping
"--------------
let mapleader = ","

