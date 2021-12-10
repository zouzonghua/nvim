"===============================================================================
" plugins
"===============================================================================
call plug#begin('~/.config/nvim/plugged')

    if has('nvim')

      " appearance
      Plug 'nvim-lualine/lualine.nvim'
      Plug 'akinsho/bufferline.nvim'
      Plug 'kyazdani42/nvim-web-devicons'

      " git
      Plug 'ttys3/nvim-blamer.lua'

      " markdown
      Plug 'dhruvasagar/vim-table-mode'
      Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

      " editor
      Plug 'jiangmiao/auto-pairs'
      Plug 'editorconfig/editorconfig-vim'
      Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
      Plug 'ybian/smartim'

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
      Plug 'hrsh7th/cmp-nvim-lsp'
      Plug 'hrsh7th/nvim-cmp'

      " luasnip
      Plug 'saadparwaiz1/cmp_luasnip'
      Plug 'L3MON4D3/LuaSnip'

      " colorscheme
      Plug 'tomasiser/vim-code-dark'

    endif

  call plug#end()

"===============================================================================
" Settings
"===============================================================================
  set clipboard=unnamed          " 设置寄存器和系统剪切板通用
  set noswapfile                 " 不生成缓冲文件
  set nocompatible               " 不与Vi 兼容（采用Vim 自己的操作命令)
  set backspace=indent,eol,start " 解决退格键失效的问题
  set updatetime=100             " 刷新时间
  set mouse=a                    " 支持使用鼠标
  set hidden                     " 允许隐藏一个未保存的 Buffer
  set completeopt=menuone,noselect " Set completeopt to have a better completion experience

"===============================================================================
" Filetype and Encoding
"===============================================================================
  filetype on           " 识别文件类型
  filetype indent on    " 根据文件类型进行缩放
  filetype plugin on    " 根据文件类型载入插件

"===============================================================================
" file encoding
"===============================================================================
  set encoding=utf-8
  scriptencoding utf-8

"===============================================================================
" key mapping
"===============================================================================
  let mapleader = ','

