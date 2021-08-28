" 跳转<++>
autocmd Filetype markdown inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>d4li

" 标题
autocmd Filetype markdown inoremap ;1 #<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ;4 ####<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ;5 #####<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ;6 ######<Space><Enter><Enter><++><Esc>2kA

" 超链接
autocmd Filetype markdown inoremap ;l [](<++>)<Esc>F]i
" 图片
autocmd Filetype markdown inoremap ;p ![](<++>)<Esc>F]i
" 待办
autocmd Filetype markdown inoremap ;t - [ ]

" 斜体
autocmd Filetype markdown inoremap ;i ** <++><Esc>F*i
" 加租
autocmd Filetype markdown inoremap ;b **** <++><Esc>F*;i
" 斜体加粗
autocmd Filetype markdown inoremap ;n ****** <++><Esc>F*;;i
" 删除
autocmd Filetype markdown inoremap ;s ~~~~ <++><Esc>F~;i
" 水平线
autocmd Filetype markdown inoremap ;h ------<Enter><Enter>

" 单行代码
autocmd Filetype markdown inoremap ;v `` <++><Esc>F`i
" 代码块
autocmd Filetype markdown inoremap ;c ```<Enter><++><Enter>```<Esc>kkA

" 特殊内容时，比如矩阵、公式、希腊字符等
autocmd Filetype markdown inoremap ;m $$ <++><Esc>F$i
autocmd Filetype markdown inoremap ;; $$$$ <++><Esc>F$;i
