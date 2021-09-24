"--------------
" key mapping
"--------------

" disabled arrow
  noremap <UP> <NOP>
  noremap <DOWN> <NOP>
  noremap <LEFT> <NOP>
  noremap <RIGHT> <NOP>
  inoremap <UP> <NOP>
  inoremap <DOWN> <NOP>
  inoremap <LEFT> <NOP>
  inoremap <RIGHT> <NOP>

" 代码换行自定义快捷键 <leader> z
let g:isWrapStatus = 0
nnoremap <leader>z :call ToggleWrap()<cr>
fun! ToggleWrap()
    if g:isWrapStatus == 0
        exe ':set wrap'
        let g:isWrapStatus = 1
    else
        exe ':set nowrap'
        let g:isWrapStatus = 0
    endif
endfun

