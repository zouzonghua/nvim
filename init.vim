" vim 插件
call plug#begin()

 " 底部状态栏
 Plug 'vim-airline/vim-airline'       
 Plug 'vim-airline/vim-airline-themes' "airline 的主题

 " 侧边栏文件管理器
 Plug 'preservim/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'ryanoasis/vim-devicons'

 " 自定补全括号
 " Plug 'jiangmiao/auto-pairs'

 " 智能提示
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " 主题
 " Plug 'morhetz/gruvbox'
 Plug 'mhartington/oceanic-next'

 " git 插件
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }

 " markdown 插件
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

 call plug#end()

" nvim 配置
 
" 显示行号
 set number
" 高亮当前行
 set cursorline

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" 插件配置
 
"==================== NERDTree =====================

" config

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree

" 设置 NERDTree 窗口宽度
" let NERDTreeWinSize=45

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeShowBookmarks=1

" 按下 control+b 调出/隐藏 NERDTree
 map <C-b> :NERDTreeToggle<CR>


"==================== gruvbox =====================
" autocmd vimenter * ++nested colorscheme gruvbox
" 在 bashrc 或 zshrc 里面添加 gruvbox 的 256 色表：
" source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh"


"==================== gitgutter =====================
" 刷新时间
set updatetime=100


"==================== devicons =====================
set encoding=UTF-8


"==================== MarkdownPreView =====================

autocmd Filetype markdown noremap ,m :MarkdownPreview<CR>
autocmd Filetype markdown noremap ,ms :MarkdownPreviewStop<CR>


"==================== LazyGit =====================
" setup mapping to call :LazyGit
map <C-g> :LazyGit<CR>

