local status, telescope = pcall(require, 'telescope')
if not status then
    return
end

local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap
local N = { noremap = true, silent= true }

telescope.setup{
  defaults = {
    prompt_prefix = "",
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

_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end

map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>', N)
map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>', N)
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>', N)
