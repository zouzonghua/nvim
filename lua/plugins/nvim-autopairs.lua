local utils = require 'utils'
local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  return utils.emptyConfig()
end

local M = {}

function M.config()
  autopairs.setup { disable_filetype = { 'TelescopePrompt', 'vim' } }
end

return M
