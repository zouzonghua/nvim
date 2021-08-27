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
      sort_by = function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.ordinal < buffer_b.ordinal
      end
    }
  }
EOF

  " These commands will navigate through buffers in order regardless of which mode you are using
  " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  nnoremap <silent><C-l> :BufferLineCycleNext<CR>
  nnoremap <silent><C-h> :BufferLineCyclePrev<CR>
  nnoremap <silent><C-x> :bd<CR>
  nnoremap <silent><Leader>hh :BufferLineCloseLeft<CR>
  nnoremap <silent><Leader>ll :BufferLineCloseRight<CR>

  " These commands will move the current buffer backwards or forwards in the bufferline
 " nnoremap <silent><mymap> :BufferLineMoveNext<CR>
 " nnoremap <silent><mymap> :BufferLineMovePrev<CR>

  " These commands will sort buffers by directory, language, or a custom criteria
  " nnoremap <silent>be :BufferLineSortByExtension<CR>
  " nnoremap <silent>bd :BufferLineSortByDirectory<CR>
  " nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

catch
endtry

