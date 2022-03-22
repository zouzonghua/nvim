-- https://github.com/wbthomason/packer.nvim#bootstrapping

local present, packer = pcall(require, 'packer')

if not present then
    local packer_path = vim.fn.stdpath 'data'
        .. '/site/pack/packer/opt/packer.nvim'

    -- print 'Cloning packer..'
    -- remove the dir before cloning
    vim.fn.delete(packer_path, 'rf')
    vim.fn.system {
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        '--depth',
        '20',
        packer_path,
    }

    vim.cmd 'packadd packer.nvim'
    present, packer = pcall(require, 'packer')

    if present then
        print 'Packer cloned successfully.'
    else
        error(
            'Couldn\'t clone packer !\nPacker path: '
                .. packer_path
                .. '\n'
                .. packer
        )
    end
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'single' }
        end,
        prompt_border = 'single',
    },
    git = {
        clone_timeout = 6000, -- seconds
    },
    auto_clean = true,
    compile_on_sync = true,
}

-- Install your plugins here
return packer.startup(function(use)
    -- PluginManager
    use {
        'wbthomason/packer.nvim',
    }

    -- Appearance
    use {
        'nvim-lualine/lualine.nvim',
        config = require('plugins.lualine').config(),
        requires = { 'kyazdani42/nvim-web-devicons' },
    }
    use {
        'akinsho/bufferline.nvim',
        config = require('plugins.bufferline').config(),
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = require('plugins.gitsigns').config(),
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }

    -- Markdown
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        config = require('plugins.markdown-preview').config(),
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    }

    -- Editor
    use {
        'windwp/nvim-autopairs',
        config = require('plugins.nvim-autopairs').config(),
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugins.treesitter').config(),
        run = ':TSUpdate',
    }
    use {
        'editorconfig/editorconfig-vim',
        ft = { 'typescript', 'javascript', 'html', 'css' },
    }
    use {
        'ybian/smartim',
        config = require('plugins.smartim').config(),
    }

    -- Termial
    use {
        'kassio/neoterm',
        config = require('plugins.neoterm').config(),
    }

    -- FileExplorer
    use {
        'Shougo/defx.nvim',
        run = ':UpdateRemotePlugins',
        config = require('plugins.defx').config(),
        requires = {
            { 'kristijanhusak/defx-icons' },
            { 'kristijanhusak/defx-git' },
        },
    }

    -- Search
    use {
        'nvim-telescope/telescope.nvim',
        config = require('plugins.telescope').config(),
        requires = {
            { 'nvim-lua/plenary.nvim' },
        },
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = require('plugins.lsp').config(),
    } -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

    -- Cmp plugins
    use {
        'hrsh7th/nvim-cmp',
        config = require('plugins.nvim-cmp').config(),
    } -- The completion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- lsp completion
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions

    -- Snippets
    use 'L3MON4D3/LuaSnip' --snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- Colorscheme
    use {
        'tomasiser/vim-code-dark',
    }

    -- Ledger
    use {
        'ledger/vim-ledger',
        ft = { 'ledger' },
    }

    -- Beancount
    use {
        'nathangrigg/vim-beancount',
        ft = { 'beancount' },
    }
end)
