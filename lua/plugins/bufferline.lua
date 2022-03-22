local utils = require 'utils'

local status, bufferline = pcall(require, 'bufferline')
if not status then
    return utils.emptyConfig()
end

local M = {}

function M.config()
    _G.zzh = {}
    bufferline.setup {
        options = {
            numbers = function(opts)
                return string.format('%s.', opts.ordinal, opts.id)
            end,
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return '(' .. count .. ')'
            end,
            show_close_icon = false,
            offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
            sort_by = function(buffer_a, buffer_b)
                -- add custom logic
                return buffer_a.ordinal < buffer_b.ordinal
            end,
        },
    }

    local function close_buffer()
        if vim.fn.winnr() == vim.fn.winnr '$' then
            vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
            vim.cmd 'bd'
            vim.cmd 'Defx -buffer-name=tab`tabpagenr()`'
            vim.cmd 'wincmd l'
        else
            vim.cmd 'bd'
        end
    end

    _G.zzh.close_buffer = close_buffer

    local map = vim.api.nvim_set_keymap
    local N = { noremap = true, silent = true }
    map('n', '<C-x>', ':lua zzh.close_buffer()<CR>', N)
    map('n', '<C-l>', ':BufferLineCycleNext<CR>', N)
    map('n', '<C-h>', ':BufferLineCyclePrev<CR>', N)
end

return M

--  vim.api.nvim_get_current_buf()
--   function! s:close_buffer()
--     let window_counter = 0
--     windo let window_counter = window_counter + 1
--     echo window_counter
--     " 判断窗口数量 https://stackoverflow.com/questions/4198503/number-of-windows-in-vim
--     if window_counter == 1
--        :bd
--     elseif window_counter == 2
--        Defx -buffer-name=tab`tabpagenr()`
--        :bd
--        Defx -buffer-name=tab`tabpagenr()`
--        :wincmd l
--     else
--       :q
--     endif
--   endfunction

--
