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

  -- 1、当前有一个窗口 运行 :bd
  -- 2、当前有两个窗口 运行 and 当前所在窗口不在 defx and 当前窗口包含 defx 运行 :defx bd defx wincmd l
  -- 3、当前有两个窗口 运行 and 当前所在窗口不在 defx and 当前窗口不包含 defx 运行 :<C-w> q
  -- 4、当前有三个窗口及以上 and 当前所在窗口不在 defx 运行 :<C-w> q
  local close_buffer = function()
    local total_buf_num = vim.fn.winnr '$'
    local current_buf_num = vim.fn.winnr()
    local is_last_buf = total_buf_num == current_buf_num
    local is_defx_buf = vim.fn.getwinvar(current_buf_num, '&filetype') == 'defx'
    local is_include_defx_buf = false

    for i = current_buf_num, 1, -1 do
      is_include_defx_buf = vim.fn.getwinvar(i, '&filetype') == 'defx'
      if is_include_defx_buf then break end
    end

    if is_last_buf and current_buf_num == 1 then
      vim.cmd 'bd'
    end

    if total_buf_num == 2 and is_include_defx_buf and not is_defx_buf then
      vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
      vim.cmd 'bd'
      vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
      vim.cmd 'wincmd l'
    end

    if total_buf_num == 2 and not is_include_defx_buf then
      vim.cmd 'wincmd q'
    end

    if total_buf_num >= 3 and not is_defx_buf then
      vim.cmd 'wincmd q'
    end
  end

  vim.keymap.set('n', '<C-c>', close_buffer)
end

return M
