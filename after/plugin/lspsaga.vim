if !exists('g:loaded_lspsaga')
  echom 'Not loaded lspsaga'
  finish
endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

 nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
 nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
 nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

 nnoremap <silent> gd :Lspsaga preview_definition<CR>
 nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
 nnoremap <silent><leader>fr <cmd>Telescope lsp_references<cr>

 nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>
 nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>

 nnoremap <silent><leader>rn :Lspsaga rename<CR>

 nnoremap <silent><leader>ca :Lspsaga code_action<CR>
 vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

