local packer = require 'lib.packer-init'

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Let packer manage itself

  use { 'christoomey/vim-tmux-navigator' }
  use { 'farmergreg/vim-lastplace' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-eunuch' } -- Adds :Rename, :Move, :Delete
  use { 'tpope/vim-unimpaired' } -- Adds [b and other handy mappings
  -- use { 'tpope/vim-sleuth' } -- Indent autodetection with editorconfig support

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('user.plugins.autopairs')
    end
  }

  use {
    'chriskempson/base16-vim',
    config = function() 
      require('user.plugins.theme')
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.bufferline')
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.lualine')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.nvim-tree')
    end
  }

  use {
    'voldikss/vim-floaterm',
    requires = {
      'szw/vim-maximizer'
    },
    config = function()
      require('user.plugins.floaterm')
    end
  }

--  use {
--    'nvim-telescope/telescope.nvim',
--    requires = {
--      { 'nvim-lua/plenary.nvim' },
--      { 'kyazdani42/nvim-web-devicons' },
--      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
--      { 'nvim-telescope/telescope-live-grep-raw.nvim' },
--    },
--    config = function()
--      require('user.plugins.telescope')
--    end
--  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      'RRethy/nvim-treesitter-endwise',
      -- 'lewis6991/spellsitter.nvim',
      -- 'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('user.plugins.treesitter')
      -- require('spellsitter').setup()
    end
  }

  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
    cmd = 'G',
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup { sign_priority = 20 }
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'b0o/schemastore.nvim',
      'folke/lsp-colors.nvim',
      'weilbith/nvim-code-action-menu',
    },
    config = function ()
      require('user.plugins.lspconfig')
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('user.plugins.luasnip')
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'jessarcher/cmp-path',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('user.plugins.cmp')
    end
  }
end)
