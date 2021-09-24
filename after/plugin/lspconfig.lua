local status, nvim_lsp = pcall(require, 'lspconfig')

if not status then
    return
end

-- need install `npm i -g typescript typescript-language-server vscode-langservers-extracted diagnostic-languageserver eslint_d prettier`

local nvim_lsp = require 'lspconfig'
local protocol = require 'vim.lsp.protocol'
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.cssls.setup { capabilities = capabilities }
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    require('completion').on_attach(client, bufnr)

    -- protocol.SymbolKind = { }
    protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '1', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
    }
end

local efm_formatters = {
    prettier = { formatCommand = 'prettier', rootMarkers = { 'package.json' } },
    stylua = {
        formatCommand = 'stylua --config-path ~/.config/stylua.toml -',
        formatStdin = true,
    },
    lua = { formatCommand = 'lua-format -i', formatStdin = true },
}

nvim_lsp.efm.setup {
    on_attach = on_attach,
    cmd = { 'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5' },
    init_options = { documentFormatting = true },
    filetypes = {
        'lua',
        'html',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
    },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            html = { efm_formatters.orettier },
            javascript = { efm_formatters.prettier },
            javascriptreact = { efm_formatters.prettier },
            typescript = { efm_formatters.prettier },
            typescriptreact = { efm_formatters.prettier },
            lua = { efm_formatters.stylua },
        },
    },
}

-- nvim_lsp.flow.setup { on_attach = on_attach }

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end,
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = {
        'javascript',
        'javascriptreact',
        'json',
        'typescript',
        'typescriptreact',
        'css',
        'less',
        'scss',
        'markdown',
        'pandoc',
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
        },
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
        },
        formatters = {
            eslint_d = {
                command = 'eslint_d',
                args = {
                    '--stdin',
                    '--stdin-filename',
                    '%filename',
                    '--fix-to-stdout',
                },
                rootPatterns = { '.git' },
            },
            prettier = {
                command = 'prettier',
                args = { '--stdin-filepath', '%filename' },
            },
        },
        formatFiletypes = {
            css = 'prettier',
            javascript = 'eslint_d',
            javascriptreact = 'eslint_d',
            json = 'prettier',
            scss = 'prettier',
            less = 'prettier',
            typescript = 'eslint_d',
            typescriptreact = 'eslint_d',
            json = 'prettier',
            markdown = 'prettier',
        },
    },
}

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = { spacing = 4, prefix = '' },
    }
)
