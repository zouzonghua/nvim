local utils = require 'utils'

-- command mode
utils.map('c', '<C-a>', '<Home>')
utils.map('c', '<C-e>', '<End>')
utils.map('c', '<C-f>', '<Right>')
utils.map('c', '<C-b>', '<Left>')
utils.map('c', '<M-f>', '<S-Right>')
utils.map('c', '<M-b>', '<S-Left>')

-- move selected line
utils.map('v', 'J', [[:m '>+1<CR>gv=gv]])
utils.map('v', 'K', [[:m '<-2<CR>gv=gv]])

-- search
utils.map('n', '<Enter>', ':nohlsearch<Enter><Enter>')

-- neoterm
utils.map('n', '<C-y>', ':Ttoggle<CR>')
utils.map('t', '<C-y>', '<C-\\><C-N>:Ttoggle<CR>')
utils.map('t', '<esc>', [[<C-\><C-n>]])

-- telescope
utils.map(
    'n',
    '<leader>ff',
    ':lua require("telescope.builtin").find_files()<cr>'
)
utils.map(
    'n',
    '<leader>fg',
    ':lua require("telescope.builtin").live_grep()<cr>'
)
utils.map(
    'n',
    '<leader>fh',
    ':lua require("telescope.builtin").help_tags()<cr>'
)

-- defx
utils.map('n', '<C-e>', ':<C-u> Defx -buffer-name=tab`tabpagenr()`<CR>')

-- bufferline
utils.map('n', '<C-l>', ':BufferLineCycleNext<CR>')
utils.map('n', '<C-h>', ':BufferLineCyclePrev<CR>')
utils.map('n', '<Leader>ll', ':BufferLineCloseRight<CR>')
utils.map('n', '<Leader>hh', ':BufferLineCloseLeft<CR>')
utils.map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>')
utils.map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>')
utils.map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>')
utils.map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>')

