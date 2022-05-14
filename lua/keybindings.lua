-- command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<M-f>', '<S-Right>')
vim.keymap.set('c', '<M-b>', '<S-Left>')

-- move selected line
vim.keymap.set('v', 'K', [[<cmd>m '<-2<CR>gv=gv]])
vim.keymap.set('v', 'J', [[<cmd>m '>+1<CR>gv=gv]])

-- search
vim.keymap.set('n', '<Enter>', "<cmd>nohlsearch<Enter><Enter>")

-- neoterm
vim.keymap.set('n', '<C-y>', "<cmd>Ttoggle<CR>")
vim.keymap.set('t', '<C-y>', "<C-\\><C-N>:Ttoggle<CR>")
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', 'ff', telescope.find_files)
vim.keymap.set('n', 'fg', telescope.live_grep)
vim.keymap.set('n', 'fh', telescope.help_tags)

-- defx
vim.keymap.set('n', '<C-e>', '<cmd> Defx -buffer-name=tab`tabpagenr()`<CR>')

-- bufferline
vim.keymap.set('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<Leader>ll', '<cmd>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<Leader>hh', '<cmd>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<Leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<Leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<Leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<Leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')

