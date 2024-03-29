local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

mason.setup()
mason_lspconfig.setup({
  automatic_installation = true
})

local handlers = require('plugins.lsp.handlers')
local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
local jsonls_opts = require 'plugins.lsp.settings.jsonls'
local sumneko_opts = require 'plugins.lsp.settings.sumneko_lua'
local beancount_opts = require 'plugins.lsp.settings.beancount'
local stylelint_lsp_opts = require 'plugins.lsp.settings.stylelint_lsp'

local deep_clone = function(extraOpts)
  return vim.tbl_deep_extend('force', extraOpts, opts)
end

lspconfig.cssls.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.jsonls.setup(deep_clone(jsonls_opts))
lspconfig.beancount.setup(deep_clone(beancount_opts))
lspconfig.sumneko_lua.setup(deep_clone(sumneko_opts))
lspconfig.stylelint_lsp.setup(deep_clone(stylelint_lsp_opts))
