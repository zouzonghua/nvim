" kassio/neoterm
" hidden in bufferline https://github.com/akinsho/bufferline.nvim/issues/176#issuecomment-892813339
autocmd FileType neoterm set nobuflisted

let g:neoterm_default_mod = 'botright'
" let g:neoterm_size = 40
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>s :TREPLSendLine<CR>
vnoremap <leader>s :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif
