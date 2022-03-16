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


function M.try(block)
    local main = block.main
    local catch = block.catch
    local finally = block.finally

    assert(main)

    -- try to call it
    local ok, errors = xpcall(main, debug.traceback)
    if not ok then
        -- run the catch function
        if catch then
            catch(errors)
        end
    end

    -- run the finally function
    if finally then
        finally(ok, errors)
    end

    -- ok?
    if ok then
        return errors
    end
end

return M
