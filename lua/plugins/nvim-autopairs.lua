local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
    return { config = nil }
end

local M = {}

function M.config()
    autopairs.setup { disable_filetype = { 'TelescopePrompt', 'vim' } }
end

return M
