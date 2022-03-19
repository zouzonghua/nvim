-- need install `npm i -g typescript typescript-language-server vscode-langservers-extracted diagnostic-languageserver eslint_d prettier stylelint`

local lspconfig_status_ok, _ = pcall(require, "lspconfig")
if not lspconfig_status_ok then
 return
end

local nvim_lsp_installer_status_ok, _ = pcall(require, 'nvim-lsp-installer')
if not nvim_lsp_installer_status_ok then
    return
end

require("plugins.lsp.lsp-installer")
require("plugins.lsp.handlers").setup()

