try
  let g:dashboard_default_executive = 'telescope'
  nmap <Leader>ss :<C-u>SessionSave<CR>
  nmap <Leader>sl :<C-u>SessionLoad<CR>
  nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
  nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
  nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
  nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
  nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
  nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

   "SPC mean the leaderkey
  let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'leader s l',
  \ 'find_history'       : 'leader f h',
  \ 'find_file'          : 'leader f f',
  \ 'new_file'           : 'leader c n',
  \ 'change_colorscheme' : 'leader t c',
  \ 'find_word'          : 'leader f a',
  \ 'book_marks'         : 'leader f b',
  \ }
catch
endtry

