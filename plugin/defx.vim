try

nnoremap <silent><C-e> :<C-u>Defx -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent><C-i> :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

" 打开 vim 自动打开 defx
func! ArgFunc() abort
    let s:arg = argv(0)
    if isdirectory(s:arg)
        return s:arg
    else
        return fnamemodify(s:arg, ':h')
    endif
endfunc

" autocmd VimEnter * Defx `ArgFunc()`  -buffer-name=tab`tabpagenr()`

let g:defx_icons_column_length = 2


call defx#custom#column('mark', {
  \ 'readonly_icon': '',
  \ 'selected_icon': '✓',
  \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

call defx#custom#option('_', {
  \ 'winwidth': 35,
  \ 'columns': 'git:mark:indent:icons:filename:type',
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 0,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1
  \ })

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings()
  setl nonumber
  setl norelativenumber

  " Define mappings
  nnoremap <silent><buffer><expr> A
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> a
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> n
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> O
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> o
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') : defx#do_action('drop')

  nnoremap <silent><buffer><expr> > defx#do_action('resize',
  \ defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> < defx#do_action('resize',
  \ defx#get_context().winwidth - 10)
endfunction

catch
endtry

