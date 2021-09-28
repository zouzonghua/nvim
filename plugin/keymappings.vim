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

" toogle wrap
let g:isWrapStatus = 0
fun! ToggleWrap()
    if g:isWrapStatus == 0
        exe ':set wrap'
        let g:isWrapStatus = 1
    else
        exe ':set nowrap'
        let g:isWrapStatus = 0
    endif
endfun
nnoremap <leader>z :call ToggleWrap()<cr>

" formart json ts interface npm install -g quicktype
nnoremap <silent><leader>jt :.!quicktype -l ts --just-types --top-level Root<CR>
vnoremap <silent><leader>jt :'<,'>.!quicktype -l ts --just-types --top-level Root<CR>

" eslint_d fix
" https://vi.stackexchange.com/questions/104/how-can-i-see-the-full-path-of-the-current-file
autocmd Filetype typescriptreact nnoremap <leader>e :!eslint_d '%:p' --fix<CR>`F
autocmd Filetype typescript nnoremap <leader>e :!eslint_d '%:p' --fix<CR>`F
autocmd Filetype javascriptreact nnoremap <leader>e :!eslint_d '%:p' --fix<CR>`F
autocmd Filetype javascript nnoremap <leader>e :!eslint_d '%:p' --fix<CR>`F

" lsp
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>Telescope lsp_references<CR>
" code action
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
" hover doc and scroll
nnoremap <silent> K :call <SID>show_documentation()<CR>
" rename
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" jump error
nnoremap <silent> [e <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
