" hidden in bufferline  #https://github.com/akinsho/bufferline.nvim/issues/176#issuecomment-892813339
autocmd FileType neoterm set nobuflisted
" open in bottom
let g:neoterm_default_mod = 'botright'
" autoinsert
let g:neoterm_autoinsert = 1
" toogle term
nnoremap <c-y> :Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
" toogle normal mode
tnoremap <Esc> <c-\><c-n>

