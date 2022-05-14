local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

local M = {}

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = '' }
    )
  end

  local config = {
    -- disable virtual text
    virtual_text = { spacing = 4, prefix = '' },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }
  vim.diagnostic.config(config)

  local border = { border = 'rounded' }
  local hoverStyle = vim.lsp.with(
    vim.lsp.handlers.hover,
    border
  )
  local signatureHelpStyle = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    border
  )
  vim.lsp.handlers['textDocument/hover'] = hoverStyle
  vim.lsp.handlers['textDocument/signatureHelp'] = signatureHelpStyle
end

local function lsp_keymaps(buf)
  local function map(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { buffer = buf })
  end

  map('<C-k>', vim.lsp.buf.hover)
  map('gd', vim.lsp.buf.definition)
  map('[e', vim.diagnostic.goto_prev)
  map(']e', vim.diagnostic.goto_next)
  map('<leader>fm', vim.lsp.buf.formatting)
  map('<leader>ca', vim.lsp.buf.code_action)
  map('<leader>q', vim.diagnostic.setloclist)
end

M.on_attach = function(client, buf)
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end

  lsp_keymaps(buf)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
