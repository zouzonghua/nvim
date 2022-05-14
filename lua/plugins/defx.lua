local utils = require 'utils'
local M = {}

function M.config()
  utils.try {
    main = function()
      vim.g.defx_icons_column_length = 2
      vim.fn['defx#custom#column']('mark', { readonly_icon = '', selected_icon = '✓', })
      vim.fn['defx#custom#column']('git', 'indicators', {
        Modified = '✹',
        Staged = '✚',
        Untracked = '✭',
        Renamed = '➜',
        Unmerged = '═',
        Ignored = '☒',
        Deleted = '✖',
        Unknown = '?',
      })
      vim.fn['defx#custom#option']('_', {
        winwidth = 35,
        columns = 'git:mark:indent:icons:filename:type',
        split = 'vertical',
        direction = 'topleft',
        show_ignored_files = 0,
        toggle = 1,
        resume = 1,
      })

      local function buf_map(lhs, rhs)
        local options = { noremap = true, silent = true, expr = true }
        vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, options)
      end

      _G.zzh.defx_settings = function()
        vim.cmd 'setl nonumber'
        buf_map('h', [[defx#do_action('cd', ['..'])]])
        buf_map('l', [[defx#do_action('drop')]])
        buf_map('c', [[defx#do_action('copy')]])
        buf_map('m', [[defx#do_action('move')]])
        buf_map('p', [[defx#do_action('paste')]])
        buf_map('R', [[defx#do_action('rename')]])
        buf_map('x', [[defx#do_action('remove')]])
        buf_map('N', [[defx#do_action('new_file')]])
        buf_map('A', [[defx#do_action('toggle_select_all')]])
        buf_map('.', [[defx#do_action('toggle_ignored_files')]])
        buf_map('<Enter>', [[defx#do_action('execute_system')]])
        buf_map('<Space>', [[defx#do_action('toggle_select') . 'j']])
        buf_map('r', [[defx#do_action('clear_clipboard') . defx#do_action('redraw')]])
        buf_map('o', [[defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')]])
        buf_map('>', [[defx#do_action('resize',defx#get_context().winwidth + 10)]])
        buf_map('<', [[defx#do_action('resize',defx#get_context().winwidth - 10)]])
      end

      vim.cmd 'autocmd FileType defx lua _G.zzh.defx_settings()'
    end,
    catch = function()
      -- print('catch : ' .. errors)
    end,
    finally = function(ok)
      -- print('finally : ' .. tostring(ok))
      if not ok then
        return utils.emptyConfig()
      end
    end,
  }
end

return M
