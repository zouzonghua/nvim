local M = {}

function M.config()
    local map = vim.api.nvim_set_keymap
    local N = { noremap = true, silent = true }

    map('n', '<C-y>', ':Ttoggle<CR>', N)
    map('t', '<C-y>', '<C-\\><C-N>:Ttoggle<CR>', { silent = true })
    map('t', '<esc>', [[<C-\><C-n>]], {})

    -- open in bottom
    vim.g.neoterm_default_mod = 'botright'
    -- autoinsert
    vim.g.neoterm_autoinsert = 1
    -- hidden in bufferline  #https://github.com/akinsho/bufferline.nvim/issues/176#issuecomment-892813339
    vim.cmd [[autocmd FileType neoterm set nobuflisted]]
end

return M
