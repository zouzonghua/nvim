local root_pattern = require("lspconfig").util.root_pattern

return {
   cmd = { "stylelint-lsp", "--stdio" },
   filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
   root_dir =  root_pattern('.stylelintrc', 'package.json'),
   settings = {
       stylelintplus = {
           autoFixOnSave = true,
           autoFixOnFormat = true,
       }
   }
}
