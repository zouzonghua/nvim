try

lua << EOF
  require("bufferline").setup{
    options= {
      numbers = function(opts)
        return string.format('%s.', opts.ordinal, opts.id)
      end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      show_close_icon = false,
      offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
      sort_by = function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.ordinal < buffer_b.ordinal
      end
    }
  }
EOF

  nnoremap <silent><C-l> :BufferLineCycleNext<CR>
  nnoremap <silent><C-h> :BufferLineCyclePrev<CR>
  nnoremap <silent>]b :BufferLineCycleNext<CR>
  nnoremap <silent>[b :BufferLineCyclePrev<CR>

  function! s:close_buffer()
    let window_counter = 0
    windo let window_counter = window_counter + 1
    echo window_counter
    " 判断窗口数量
    if window_counter == 1
       :bd
    elseif window_counter == 2
       Defx -buffer-name=tab`tabpagenr()`
       :bd
       Defx -buffer-name=tab`tabpagenr()`
       :wincmd l
    else
      :q
    endif
  endfunction

  nnoremap <silent><c-x> <cmd>call <SID>close_buffer()<CR>
  nnoremap <silent><Leader>hh :BufferLineCloseLeft<CR>
  nnoremap <silent><Leader>ll :BufferLineCloseRight<CR>

  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

catch
endtry

