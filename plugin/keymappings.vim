"--------------
" key mapping
"--------------

" 禁用方向键
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

" 代码换行自定义快捷键 <leader> z
let g:IsWrapStatus = 0
nnoremap <leader>z :call ToggleWrap()<cr>
fun! ToggleWrap()
    if g:IsWrapStatus == 0
        exe ':set wrap'
        let g:IsWrapStatus = 1
    else
        exe ':set nowrap'
        let g:IsWrapStatus = 0
    endif
endfun

