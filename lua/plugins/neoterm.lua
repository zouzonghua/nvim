local M = {}

function M.config()
  -- open in bottom
  vim.g.neoterm_default_mod = 'botright'
  -- autoinsert
  vim.g.neoterm_autoinsert = 1
  -- hidden in bufferline  #https://github.com/akinsho/bufferline.nvim/issues/176#issuecomment-892813339
  vim.cmd [[autocmd FileType neoterm set nobuflisted]]
end

return M
