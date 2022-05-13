-- need install `npm i -g  eslint_d prettier  markdownlint-cli`
local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    formatting.prettier.with({
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'css',
        'less',
        'scss',
        -- 'markdown',
        'html',
      },
    }),
    formatting.eslint_d,
    formatting.markdownlint,
    formatting.bean_format,
    diagnostics.eslint_d,
    diagnostics.markdownlint
  },
  on_attach = require('plugins.lsp.handlers').on_attach,
  -- auto save
  --   on_attach = function(client, bufnr)
  --     print(client.name, 'client')
  --     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  --     if client.supports_method("textDocument/formatting") then
  --       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --       vim.api.nvim_create_autocmd("BufWritePre", {
  --         group = augroup,
  --         buffer = bufnr,
  --         callback = vim.lsp.buf.formatting_sync,
  --       })
  --     end
  --   end,
}
