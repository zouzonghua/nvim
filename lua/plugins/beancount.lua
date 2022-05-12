local M = {}

function M.config()
  vim.g.beancount_separator_col = '74'
  vim.cmd [[
      autocmd FileType beancount let b:beancount_root='/Users/zouzonghua/Developer/Notes/Life/Beancount/main.bean'
    ]]
end

return M
