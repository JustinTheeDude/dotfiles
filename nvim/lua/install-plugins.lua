vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Treeshitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use "nvim-telescope/telescope-file-browser.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Themes
  use 'folke/tokyonight.nvim'

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'glepnir/lspsaga.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim'
  }

	--Blankline
	use "lukas-reineke/indent-blankline.nvim"
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use { 'jose-elias-alvarez/null-ls.nvim'}
end)
