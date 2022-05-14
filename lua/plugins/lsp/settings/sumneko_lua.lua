return {
  settings = {
    Lua = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      diagnostics = {
        globals = { 'vim', 'hs' },
      },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        },
      },
    },
  },
}
