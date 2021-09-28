if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>ff <cmd>Telescope find_files prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix=🔍<cr>
nnoremap <leader>fb <cmd>Telescope buffers prompt_prefix=🔍<cr>
nnoremap <leader>fh <cmd>Telescope help_tags prompt_prefix=🔍<cr>
nnoremap <silent><leader>fr <cmd>Telescope lsp_references<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {
      "node_modules"
    }

  }
}
EOF


lua << EOF
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
EOF
