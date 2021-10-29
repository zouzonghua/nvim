"===============================================================================
" search
" :%s/源字符串/目的字符串/g
"===============================================================================
  set hlsearch        " 搜索文本高亮
  set ignorecase      " 搜索时忽略大小写
  set incsearch       " 搜索文本包含时高亮
  set smartcase       " search will be case-sensitive while searching with some upper case characters.

  " cancel search highlight if hit enter key after searching
  nnoremap <Enter> :nohlsearch<Enter><Enter>
