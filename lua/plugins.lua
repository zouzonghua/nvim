-- https://github.com/wbthomason/packer.nvim#bootstrapping


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
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
        config = require('plugins.lualine').config and require('plugins.lualine').config(),
        requires = { 'kyazdani42/nvim-web-devicons' },
    }
    use {
        'akinsho/bufferline.nvim',
        config = require('plugins.bufferline').config and require('plugins.bufferline').config(),
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- Markdown
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        config = require('plugins.markdown-preview').config
            and require('plugins.markdown-preview').config(),
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    }

    -- Editor
    use {
        'windwp/nvim-autopairs',
        config = require('plugins.nvim-autopairs').config
            and require('plugins.nvim-autopairs').config(),
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugins.treesitter').config and require('plugins.treesitter').config(),
        run = ':TSUpdate',
    }
    use {
        'editorconfig/editorconfig-vim',
        ft = { 'typescript', 'javascript', 'html', 'css' },
    }
    use {
        'ybian/smartim',
        config = require('plugins.smartim').config and require('plugins.smartim').config(),
    }

    -- Termial
    use {
        'kassio/neoterm',
        config = require('plugins.neoterm').config and require('plugins.neoterm').config(),
    }

    -- FileExplorer
    use {
        'Shougo/defx.nvim',
        run = ':UpdateRemotePlugins',
        config = require('plugins.defx').config and require('plugins.defx').config(),
        requires = {
            { 'kristijanhusak/defx-icons' },
            { 'kristijanhusak/defx-git' },
        },
    }

    -- Search
    use {
        'nvim-telescope/telescope.nvim',
        config = require('plugins.telescope').config and require('plugins.telescope').config(),
        requires = {
            { 'nvim-lua/plenary.nvim' },
        },
    }

    -- LSP Base
    use {
        'neovim/nvim-lspconfig',
        config = require('plugins.lspconfig').config and require('plugins.lspconfig').config(),
    }
    use {
        'onsails/lspkind-nvim',
        config = require('plugins.lspkind').config and require('plugins.lspkind').config(),
    }

    -- LSP Cmp
    use {
        'hrsh7th/nvim-cmp',
        config = require('plugins.nvim-cmp').config and require('plugins.nvim-cmp').config(),
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        requires = 'hrsh7th/nvim-cmp',
    }

    -- Luasnip
    use {
        'L3MON4D3/LuaSnip',
    }

    -- Colorscheme
    use {
        'tomasiser/vim-code-dark',
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
