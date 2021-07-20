if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
	""Vim LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'glepnir/lspsaga.nvim'

	""Treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	
	""Lualine
	Plug 'hoob3rt/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'ryanoasis/vim-devicons'

	"Fugitive/Git
	Plug 'tpope/vim-fugitive'

	""Vinegar/File Explorer
	Plug 'tpope/vim-vinegar'

	""Telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	""Autocomplete
	Plug 'nvim-lua/completion-nvim'

	""Brackets
	Plug 'cohama/lexima.vim'

	""Frontend
	Plug 'mattn/emmet-vim'
	Plug 'lepture/vim-jinja'
call plug#end()
