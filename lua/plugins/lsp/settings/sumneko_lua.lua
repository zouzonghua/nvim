return {
  settings = {
    Lua = {
      diagnostics = {
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
        globals = { 'vim', 'hs' },
      },

      format = {
        enable = true,
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
        },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
