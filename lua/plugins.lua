return require('packer').startup(function()

    use 'wbthomason/packer.nvim'

	use {
 		'kyazdani42/nvim-tree.lua',
		 requires = 'kyazdani42/nvim-web-devicons'
 	}

	use {
 		'akinsho/bufferline.nvim',
		 requires = 'kyazdani42/nvim-web-devicons'
 	}

	-- lsp
	use "neovim/nvim-lspconfig"
	-- use "williamboman/nvim-lsp-installer"
	-- use "tami5/lspsaga.nvim"

	-- auto complete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    --
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
	-- use "rafamadriz/friendly-snippets"
    -- use "onsails/lspkind-nvim"
    -- use "github/copilot.vim"
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

end)
