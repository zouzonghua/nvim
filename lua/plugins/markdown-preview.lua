local M = {}

function M.config()
  local vim = vim

  vim.api.nvim_exec(
    [[autocmd Filetype markdown nmap <leader>mp <Plug>MarkdownPreviewToggle]],
    false
  )
end

return M
