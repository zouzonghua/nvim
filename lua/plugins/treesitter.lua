local utils = require 'utils'

local status, configs = pcall(require, 'nvim-treesitter.configs')
if not status then
  return utils.emptyConfig()
end

local M = {}

function M.config()
  configs.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      'json',
      'yaml',
      'tsx',
      'javascript',
      'html',
      'scss',
      'vue',
      'lua',
      'beancount'
    },
  }

  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.beancount.filetype_to_parsername = { "bean" }
  parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  -- parser_config.tsx.filetype_to_parsername = {
  --   'javascript',
  --   'typescript.tsx',
  -- }
end

return M
