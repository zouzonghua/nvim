local M = {}

function M.buf_map(buf, mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.load(plugin, ...)
    local ok, module = pcall(require, plugin)
    if ok then
        module.setup(...)
    end
end

return M
