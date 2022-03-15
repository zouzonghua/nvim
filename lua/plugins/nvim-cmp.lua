local status, cmp = pcall(require, 'cmp')
if not status then
    return { config = nil }
end

local status, lspkind = pcall(require, 'lspkind')
if not status then
    return { config = nil }
end

local cmp = require 'cmp'
local lspkind = require 'lspkind'

local M = {}

function M.config()
    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
        formatting = {
            format = lspkind.cmp_format { with_text = false, maxwidth = 50 },
        },
    }
end

return M
