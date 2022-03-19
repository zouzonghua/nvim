local utils = require 'utils'

-- telescope
utils.map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>')
utils.map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>')
utils.map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>')

-- buffer
utils.map('', '<Leader>ll', ':BufferLineCloseRight<CR>')
utils.map('', '<Leader>hh', ':BufferLineCloseLeft<CR>')

-- command mode
utils.map('c', '<C-a>', '<Home>')
utils.map('c', '<C-e>', '<End>')
utils.map('c', '<C-f>', '<Right>')
utils.map('c', '<C-b>', '<Left>')
utils.map('c', '<M-f>', '<S-Right>')
utils.map('c', '<M-b>', '<S-Left>')

-- insert mode
-- utils.map('i', '<C-j>', '<Down>')
-- utils.map('i', '<C-k>', '<Up>')
-- utils.map('i', '<C-h>', '<Left>')
-- utils.map('i', '<C-l>', '<Right>')

-- move selected line

utils.map('v', 'J', [[:m '>+1<CR>gv=gv]])

utils.map('v', 'K', [[:m '<-2<CR>gv=gv]])

-- search
--  " cancel search highlight if hit enter key after searching
utils.map('n', '<Enter>', ':nohlsearch<Enter><Enter>')

-- eslint_d
vim.cmd(
    [[
      autocmd Filetype typescriptreact nmap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
      autocmd Filetype javascriptreact nmap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
      autocmd Filetype typescript nmap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
      autocmd Filetype javascript nmap <leader>fe mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
    ]]
)
