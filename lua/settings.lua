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
-- Tabs & spaces
--------------------------------------------------------------------------------
vim.o.tabstop = 2 -- The number of spaces that Vim displays when pressing the Tab key
vim.o.shiftwidth = 2 -- Indicates the length of each indentation level
vim.o.softtabstop = 2 -- Backspace key back the length of indented spaces
vim.o.expandtab = true -- use spaces
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = 'tab:»■,trail:■' -- Spaces (including Tab) show small squares

--------------------------------------------------------------------------------
-- Folding
-- zc close current folding
-- zo open current folding
-- zO open current and nested
-- zM close all
-- zR open all
--------------------------------------------------------------------------------
vim.wo.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.foldlevelstart = 99

