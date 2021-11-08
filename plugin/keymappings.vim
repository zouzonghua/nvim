"===============================================================================
" key mapping
"===============================================================================
  " disabled arrow
  noremap <UP> <NOP>
  noremap <DOWN> <NOP>
  noremap <LEFT> <NOP>
  noremap <RIGHT> <NOP>
  inoremap <UP> <NOP>
  inoremap <DOWN> <NOP>
  inoremap <LEFT> <NOP>
  inoremap <RIGHT> <NOP>
  " move up
  nnoremap <silent><C-k> :m -2<CR>
  " move down
  nnoremap <silent><C-j> :m +1<CR>
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

  " eslint_d format
  autocmd Filetype typescriptreact nnoremap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
  autocmd Filetype javascriptreact nnoremap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
  autocmd Filetype typescript nnoremap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
  autocmd Filetype javascript nnoremap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F

