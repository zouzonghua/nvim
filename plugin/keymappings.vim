"--------------
" key mapping
"--------------

" 禁用方向键
" noremap <UP> <NOP>
" noremap <DOWN> <NOP>
" noremap <LEFT> <NOP>
" noremap <RIGHT> <NOP>
" inoremap <UP> <NOP>
" inoremap <DOWN> <NOP>
" inoremap <LEFT> <NOP>
" inoremap <RIGHT> <NOP>

" 切换 Esc
imap jj <Esc>
imap kk <Esc>

" 切换代码缩进
vmap <S-Tab> <
vmap <Tab> >
nmap <S-Tab> <<
nmap <Tab> >>

" 切换 buffers
nnoremap <C-j> :bNext<CR>
nnoremap <C-k> :bnext<CR>

" 关闭 buffers
nnoremap <C-x> :bd<CR>

