--[[ Paq: Auto Install ]]--
local install_path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.execute [[ git clone --depth=1 https://github.com/savq/paq-nvim.git {install_path} ]]
end

--[[ Paq: Plugins ]]--
require("paq") {
        -- Package Manager --
        {'savq/paq-nvim'};

        -- Status lines --
        {'hoob3rt/lualine.nvim'};
        {'kyazdani42/nvim-web-devicons'};

        -- Github --
        {'ruanyl/vim-gh-line'};

        -- Language Server Packs --
        {'neovim/nvim-lspconfig'};
        {'williamboman/nvim-lsp-installer'};
        {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
        {'glepnir/lspsaga.nvim'};
        -- {'sheerun/vim-polyglot'};

        -- Autocomplete --
        {'hrsh7th/nvim-cmp'};
        {'hrsh7th/cmp-buffer'};
        {'hrsh7th/cmp-path'};
        {'hrsh7th/cmp-nvm-lua'};
        {'hrsh7th/cmp-nvim-lsp'};
        {'L3MON4D3/LuaSnip'};
        {'saadparwaiz1/cmp_luasnip'};

        -- Telescope --
        {'nvim-lua/popup.nvim'};
        {'nvim-lua/plenary.nvim'};
        {'nvim-telescope/telescope.nvim'};
        {'nvim-telescope/telescope-fzy-native.nvim'};

        -- Themes --
        {'dracula/vim', as ='dracula'};

        -- Utilities --
        {'windwp/nvim-autopairs'};
        {'ap/vim-css-color'};
        {'simeji/winresizer'};
        {'tweekmonster/django-plus.vim'};
        {'sheerun/vim-polyglot'};
}
