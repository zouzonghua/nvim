--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
vim.g.mapleader = ','
vim.o.mouse = 'a' -- mouse support
vim.opt.clipboard = { 'unnamedplus' } -- system clipboard
vim.opt.swapfile = false -- no swap file or vim.cmd('set noswapfile')

--------------------------------------------------------------------------------
-- Undodir
--------------------------------------------------------------------------------
local undodir = vim.fn.stdpath("data") .. "/undodir" -- make this directory if it doesn't exist
vim.opt.undodir = undodir
vim.opt.undofile = true -- persistent undo history

--------------------------------------------------------------------------------
-- Appearance
--------------------------------------------------------------------------------
vim.o.cc = '80' -- display line number
vim.wo.wrap = false -- nowrap
vim.o.number = true -- display line number
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.termguicolors = true -- true color
vim.opt.fillchars = { -- hidden ~
    vert = '▕', -- alternatives │
    fold = ' ',
    eob = ' ', -- suppress ~ at EndOfBuffer
    diff = '╱', -- alternatives = ⣿ ░ ─
    msgsep = '‾',
    foldopen = '▾',
    foldsep = '│',
    foldclose = '▸',
}

--------------------------------------------------------------------------------
-- file encoding & file type
--------------------------------------------------------------------------------
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- add filetype
vim.g.do_filetype_lua = 1
vim.filetype.add({
  extension = {
    bean = "beancount",
  }
})

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
vim.o.hlsearch = true -- highlight searches (:noh to turn off)
vim.o.ignorecase = true -- case insensitive searching
vim.o.incsearch = true -- do incremental searching
vim.o.smartcase = true -- overrides ignorecase when pattern contains caps

--------------------------------------------------------------------------------
-- Tabs and spaces
--------------------------------------------------------------------------------
vim.o.tabstop = 2 -- 按下 Tab 键时，Vim 显示的空格数
vim.o.shiftwidth = 2 -- 表示每一级缩进的长度
vim.o.softtabstop = 2 -- 退格键退回缩进空格的长度
vim.o.expandtab = true -- 设置缩进用空格来表示
vim.opt.list = true -- 显示非可见字符
vim.opt.listchars = 'tab:»■,trail:■' -- 多余的空格（包括 Tab 键）显示小方块

--------------------------------------------------------------------------------
-- Folding
-- zc 关闭当前 zo 打开当前 zO 打开当前以及嵌套
-- zM 关闭所有 zR 打开所有
--------------------------------------------------------------------------------
vim.wo.foldmethod = 'indent'
-- vim.wo.foldmethod = 'marker'
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.foldlevelstart = 99

