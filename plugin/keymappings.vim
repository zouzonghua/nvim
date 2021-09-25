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

" 格式化 json 格式为 ts 接口 npm install -g quicktype
 nnoremap <silent><leader>jt :.!quicktype -l ts --just-types --top-level Root<CR>
 vnoremap <silent><leader>jt :'<,'>.!quicktype -l ts --just-types --top-level Root<CR>
