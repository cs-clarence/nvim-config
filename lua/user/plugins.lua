return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Onedark Color Scheme
	use 'joshdick/onedark.vim'

	-- Nvim-Tree
	use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    	'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	},
	}

	-- ToggleTerm
	use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  	require("toggleterm").setup()
	end}
	
	-- Configs for Nvim LSP
	use 'neovim/nvim-lspconfig'

	-- LSP Installer
	use 'williamboman/nvim-lsp-installer'
end)
