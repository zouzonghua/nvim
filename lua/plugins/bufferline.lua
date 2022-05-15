local utils = require 'utils'

local bufferline_status, bufferline = pcall(require, 'bufferline')
if not bufferline_status then
  return utils.emptyConfig()
end

local M = {}

function M.config()
  bufferline.setup {
    options = {
      numbers = function(opts)
        return string.format('%s.', opts.ordinal, opts.id)
      end,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count)
        return '(' .. count .. ')'
      end,
      show_close_icon = false,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
        },
      },
      sort_by = function(buffer_a, buffer_b)
        return buffer_a.ordinal < buffer_b.ordinal
      end,
    },
  }

  _G.close_buffer = function()
    if vim.fn.winnr() == vim.fn.winnr '$'
        and vim.api.nvim_win_get_number(0) > 1
    then
      vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
      vim.cmd 'bd'
      vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
      vim.cmd 'wincmd l'
    else
      vim.cmd 'bd'
    end
  end


  local map = vim.api.nvim_set_keymap
  local N = { noremap = true, silent = true }
  map('n', '<C-c>', ':lua _G.close_buffer()<CR>', N)
end

return M

