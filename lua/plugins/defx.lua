local M = {}


function M.config()
 --  local status = vim.fn.exists("netrw")
 --  print(status)
 --  if not status then
 --  end

  vim.g.defx_icons_column_length = 2

vim.fn['defx#custom#column']('mark', {
    readonly_icon = '',
    selected_icon = '✓',
})

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

local function buf_map(buf, mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

 vim.cmd('autocmd FileType defx lua defx_my_settings()')
 local N = { noremap = true, silent = true, expr = true}
 function defx_my_settings ()
   vim.cmd('setl nonumber')
   buf_map(0, 'n', 'A', [[defx#do_action('toggle_select_all')]], N)
   buf_map(0, 'n', 'a', [[defx#do_action('toggle_select_all')]], N)
   buf_map(0, 'n', '<Space>', [[defx#do_action('toggle_select') . 'j']], N)
   buf_map(0, 'n', 'c', [[defx#do_action('copy')]], N)
   buf_map(0, 'n', 'm', [[defx#do_action('move')]], N)
   buf_map(0, 'n', 'p', [[defx#do_action('paste')]], N)
   buf_map(0, 'n', 'n', [[defx#do_action('new_file')]], N)
   buf_map(0, 'n', 'x', [[defx#do_action('remove')]], N)
   buf_map(0, 'n', 'R', [[defx#do_action('rename')]], N)
   buf_map(0, 'n', 'O', [[defx#do_action('execute_system')]], N)
   buf_map(0, 'n', 'q', [[defx#do_action('quit')]], N)
   buf_map(0, 'n', '.', [[defx#do_action('toggle_ignored_files')]], N)
   buf_map(0, 'n', 'h', [[defx#do_action('cd', ['..'])]], N)
   buf_map(0, 'n', 'l', [[defx#do_action('drop')]], N)
   buf_map(0, 'n', 'o',  [[defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')]], N)
   buf_map(0, 'n', '>', [[defx#do_action('resize',defx#get_context().winwidth + 10)]], N)
   buf_map(0, 'n', '<', [[defx#do_action('resize',defx#get_context().winwidth - 10)]], N)
end

vim.api.nvim_set_keymap('n', '<C-e>', ':<C-u> Defx -buffer-name=tab`tabpagenr()`<CR>', { noremap = true, silent = true })

end

return M
