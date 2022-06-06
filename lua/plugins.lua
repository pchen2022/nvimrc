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

	-- 自动代码补全系列插件
	-- nvim-cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    -- vsnip
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
	use "rafamadriz/friendly-snippets"
	-- lspkind
    use "onsails/lspkind-nvim"
    -- github copilot
    -- use "github/copilot.vim"

end)
