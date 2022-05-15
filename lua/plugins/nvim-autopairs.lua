local utils = require 'utils'
local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  return utils.emptyConfig()
end

local M = {}

function M.config()
  autopairs.setup {
    map_c_w = true,
    map_c_h = true,
  }
end

return M
