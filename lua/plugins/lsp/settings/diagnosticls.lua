return {
  filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'css',
      'less',
      'scss',
      'markdown',
  },
  init_options = {
      linters = {
          eslint = {
              command = 'eslint_d',
              rootPatterns = { '.git' },
              debounce = 100,
              args = {
                  '--stdin',
                  '--stdin-filename',
                  '%filepath',
                  '--format',
                  'json',
              },
              sourceName = 'eslint_d',
              parseJson = {
                  errorsRoot = '[0].messages',
                  line = 'line',
                  column = 'column',
                  endLine = 'endLine',
                  endColumn = 'endColumn',
                  message = '[eslint] ${message} [${ruleId}]',
                  security = 'severity',
              },
              securities = { [2] = 'error', [1] = 'warning' },
          },
          stylelint = {
              sourceName = 'stylelint',
              command = 'stylelint',
              args = { '--formatter', 'compact', '%filepath' },
              rootPatterns = { '.git' },
              debounce = 100,
              formatPattern = {
                  [[: line (\d+), col (\d+), (warning|error) - (.+?) \((.+)\)]],
                  {
                      line = 1,
                      column = 2,
                      security = 3,
                      message = { 4, ' [', 5, ']' },
                  },
              },
              securities = {
                  warning = 'warning',
                  error = 'error',
              },
          },
      },
      filetypes = {
          javascript = 'eslint',
          javascriptreact = 'eslint',
          typescript = 'eslint',
          typescriptreact = 'eslint',
          css = 'stylelint',
          scss = 'stylelint',
          less = 'stylelint'
      },
      formatters = {
          eslint_d = {
              command = 'eslint_d',
              args = { '--stdin', '--fix-to-stdout', '--stdin-filename', '%filepath' },
          },
          prettier = {
              command = 'prettier',
              args = { '--stdin-filepath', '%filename' },
          },
      },
      formatFiletypes = {
          css = 'prettier',
          scss = 'prettier',
          less = 'prettier',
          html = 'prettier',
          markdown = 'prettier',
          javascript = 'prettier',
          javascriptreact = 'prettier',
          typescript = 'prettier',
          typescriptreact = 'prettier',
      },
  },
}
