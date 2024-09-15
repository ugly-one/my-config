-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { "ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" }
	}
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    }
	--use {
	--	"rose-pine/neovim",
	--	as = "rose-pine",
	--	config = function()
	--		vim.cmd('colorscheme rose-pine')
	--	end
	--}

    use('stevearc/oil.nvim')
    use('kdheepak/lazygit.nvim')

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use {
		'theprimeagen/harpoon',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use('mbbill/undotree')

	-- LSP
	use { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' };
	use('neovim/nvim-lspconfig')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/nvim-cmp');
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
	use { "ray-x/lsp_signature.nvim" }
end)
