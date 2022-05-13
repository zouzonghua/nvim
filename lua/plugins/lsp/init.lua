local utils = require 'utils'

local lspconfig_status_ok, _ = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
    return utils.emptyConfig()
end

local nvim_lsp_installer_status_ok, _ = pcall(require, 'nvim-lsp-installer')
if not nvim_lsp_installer_status_ok then
    return utils.emptyConfig()
end

local M = {}

function M.config()
    require 'plugins.lsp.lsp-installer'
    require('plugins.lsp.handlers').setup()
    require 'plugins.lsp.null-ls'
end

return M
