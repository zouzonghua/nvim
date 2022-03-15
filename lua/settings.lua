vim.g.mapleader = ','

--------------------------------------------------------------------------------
-- Appearance
--------------------------------------------------------------------------------
vim.o.cc = '80' -- display line number
vim.o.number = true -- display line number
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.termguicolors = true -- true color
vim.opt.clipboard = { 'unnamedplus' } -- system clipboard
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

-- vim.o.showcmd = true -- display incomplete commands
-- vim.o.backspace = '2' -- Backspace deletes like most programs in insert mode
-- vim.o.hlsearch = true -- highlight searches (:noh to turn off)
-- vim.o.ignorecase = true -- case insensitive searching
-- vim.o.smartcase = true -- overrides ignorecase when pattern contains caps
-- vim.o.laststatus = 2 -- Always display the status line
-- vim.o.ruler = true -- show the cursor position all the time
-- vim.o.incsearch = true -- do incremental searching

--------------------------------------------------------------------------------
-- Tabs and spaces
--------------------------------------------------------------------------------
vim.o.tabstop = 2 -- 按下 Tab 键时，Vim 显示的空格数
vim.o.shiftwidth = 2 -- 表示每一级缩进的长度
vim.o.softtabstop = 2 -- 退格键退回缩进空格的长度
vim.o.backspace = 'indent,eol,start' -- 退格键插入模式删除
vim.o.expandtab = true -- 设置缩进用空格来表示
vim.opt.list = true -- 显示非可见字符
vim.opt.listchars = 'tab:»■,trail:■' -- 多余的空格（包括 Tab 键）显示小方块

-- vim.o.autoindent = true
-- vim.o.smartindent = true
-- vim.o.smarttab = true
-- vim.o.joinspaces = false

--------------------------------------------------------------------------------
-- Folding
--
-- foldmethod:
-- manual           手工定义折叠
-- indent           更多的缩进表示更高级别的折叠
-- expr             用表达式来定义折叠
-- syntax           用语法高亮来定义折叠
-- diff             对没有更改的文本进行折叠
-- marker           对文中的标志折叠
--
-- keymappings
-- zc 关闭当前 zo 打开当前 zO 打开当前以及嵌套
-- zM 关闭所有 zR 打开所有
--------------------------------------------------------------------------------
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99 -- 折叠层级
vim.foldlevelstart = 99
