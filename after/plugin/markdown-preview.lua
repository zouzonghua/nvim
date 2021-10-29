local vim = vim

vim.api.nvim_exec([[autocmd Filetype markdown nmap <C-p> <Plug>MarkdownPreviewToggle]], false)
