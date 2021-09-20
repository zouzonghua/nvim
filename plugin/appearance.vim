"--------------
" appearance
"--------------
set number                  " 显示行号
" set rnu                     " 显示相对行号
set cursorline              " 高亮当前选中行
set showtabline=2           " 显示 tab 分页
set cc=80                   " 每行 80 个字符
set linebreak               " 文本换行以文字为单位
set showcmd                 " 底部显示键入指令
set nowrap                  " 文本折行
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾ " 隐藏波浪线

"--------------
" foldmethod
" manual           手工定义折叠
" indent           更多的缩进表示更高级别的折叠
" expr             用表达式来定义折叠
" syntax           用语法高亮来定义折叠
" diff             对没有更改的文本进行折叠
" marker           对文中的标志折叠
"---------------
set fdm=indent


"--------------
" split window
"--------------
set splitbelow
set splitright

"--------------
" Scroll
"--------------
set scrolloff=3              " 垂直滚动时，光标距离顶部/底部的位置（单位：行）

"--------------
" Tab and space
"--------------
set tabstop=2                " 按下 Tab 键时，Vim 显示的空格数
set softtabstop=2            " 退格键退回缩进空格的长度
set shiftwidth=2             " 表示每一级缩进的长度
set expandtab                " 设置缩进用空格来表示
set listchars=tab:»■,trail:■ " 多余的空格（包括 Tab 键）显示小方块
set list                     " 显示非可见字符

"--------------
" ColorScheme
"--------------
"set termguicolors             " enable true color
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
set t_Co=256                  " 启用256色
set t_ut=
syntax on                     " 语法高亮

if has('termguicolors')
  set termguicolors
endif

try
    colorscheme codedark
catch
endtry

