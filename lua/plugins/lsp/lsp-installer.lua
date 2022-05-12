-- need install `LspInstall stylelint_lsp sumneko_lua tsserver jsonls html`
local lsp_installer_status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

lsp_installer.setup {
  automatic_installation = true,
}

local opts = {
  on_attach = require('plugins.lsp.handlers').on_attach,
  capabilities = require('plugins.lsp.handlers').capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
local stylelint_lsp_opts = require 'plugins.lsp.settings.stylelint_lsp'
local jsonls_opts = require 'plugins.lsp.settings.jsonls'
local sumneko_opts = require 'plugins.lsp.settings.sumneko_lua'

local deep_clone = function(settings)
  return vim.tbl_deep_extend('force', settings, opts)
end

lspconfig.tsserver.setup(opts)
lspconfig.jsonls.setup(deep_clone(jsonls_opts))
lspconfig.stylelint_lsp.setup(deep_clone(stylelint_lsp_opts))
lspconfig.sumneko_lua.setup(deep_clone(sumneko_opts))
