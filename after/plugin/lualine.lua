local status, lualine = pcall(require, 'lualine')
if not status then
    return
end
lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'codedark',
        section_separators = { left = '', right = '' },
        component_separators = { left = '❱', right = '❰' },
        disabled_filetypes = { 'defx' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'diff',
                colored = true, -- displays diff status in color if set to true
                diff_color = {
                    added = { fg = '#B6CA52' }, -- changes diff's added foreground color
                    modified = { fg = '36A3D9' }, -- changes diff's modified foreground color
                    removed = { fg = '#FF3333' }, -- changes diff's removed foreground color
                },
                symbols = { added = '+', modified = '~', removed = '-' }, -- changes diff symbols
            },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    hint = ' ',
                },
            },
            'encoding',
            { 'fileformat', icons_enabled = true },
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = jst filename, 1 = relative path, 2 = absolute path
            },
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    -- extensions = { 'fugitive', 'nvim-tree' },
}
