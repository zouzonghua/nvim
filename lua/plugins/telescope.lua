local utils = require 'utils'

local telescope_status, telescope = pcall(require, 'telescope')
if not telescope_status then
  return utils.emptyConfig()
end

local M = {}

function M.config()
  local actions = require 'telescope.actions'

  telescope.setup {
    defaults = {
      prompt_prefix = '',
      mappings = {
        n = {
          ['q'] = actions.close,
        },
      },
      file_ignore_patterns = {
        'node_modules',
      },
    },
  }

  _G.telescope_live_grep_in_path = function(path)
    local _path = path or vim.fn.input('Dir: ', '', 'dir')
    require('telescope.builtin').live_grep { search_dirs = { _path } }
  end
end

return M
