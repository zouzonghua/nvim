-- command mode
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<M-b>', '<S-Left>')
vim.keymap.set('c', '<M-f>', '<S-Right>')

-- move selected line
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- search
vim.keymap.set('n', '<Enter>', '<cmd>nohlsearch<Enter><Enter>')

-- bufferline
vim.keymap.set('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<Leader>hh', '<cmd>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<Leader>ll', '<cmd>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<Leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<Leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<Leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<Leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')

-- neoterm
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<C-t>', '<cmd>Ttoggle<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-N>:Ttoggle<CR>')

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<Leader>fg', telescope.live_grep)
vim.keymap.set('n', '<Leader>fh', telescope.help_tags)
vim.keymap.set('n', '<Leader>ff', telescope.find_files)

-- defx
vim.keymap.set('n', '<C-e>', '<cmd> Defx -buffer-name=tab`tabpagenr()`<CR>')
