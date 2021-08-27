
lua << EOF
    local status, formatter = pcall(require, "formatter")
    if (not status) then return end
    local prettier = function()
        return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
        }
    end
    formatter.setup({
      filetype = {
        javascript = {prettier},
        javascriptreact = {prettier},
        typescript = {prettier},
        typescriptreact = {prettier},
      }
    })
EOF

nnoremap <silent> <leader>p :Format<CR>
