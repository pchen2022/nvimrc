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
    use {
        "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
            {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
            {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
            {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
            {"hrsh7th/cmp-path"}, -- 路径补全
            {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
            {"hrsh7th/cmp-cmdline"}, -- 命令补全
            {"f3fora/cmp-spell"}, -- 拼写建议
            {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
            {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
            {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
    }

    -- github copilot 自动补全
    use "github/copilot.vim"

end)
