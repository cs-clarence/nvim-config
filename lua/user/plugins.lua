local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Gruvbox Color Scheme
	use 'morhetz/gruvbox'

	-- Feline Plugin, for the status bar thingy
	use 'feline-nvim/feline.nvim'

	-- For file icons
	use 'kyazdani42/nvim-web-devicons'

	-- Nvim-Tree, the file manager on the side
	use 'kyazdani42/nvim-tree.lua'

	-- ToggleTerm
	use 'akinsho/toggleterm.nvim'
	
	-- Configs for Nvim LSP
	use 'neovim/nvim-lspconfig'

	-- LSP Installer
	use 'williamboman/nvim-lsp-installer'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
