local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Fzf, a fancy fuzzy finder
	use 'ibhagwan/fzf-lua'

	-- Gruvbox Color Scheme
	use 'morhetz/gruvbox'

	-- Lualine Plugin, for the status line at the bottom
	use 'nvim-lualine/lualine.nvim'

	-- For file icons
	use 'kyazdani42/nvim-web-devicons'

	-- Nvim-Tree, the file manager on the side
	use 'kyazdani42/nvim-tree.lua'

	-- ToggleTerm
	use 'akinsho/toggleterm.nvim'

	-- Plugins For Code Completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/nvim-cmp'

	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- Configs for Nvim LSP
	use 'neovim/nvim-lspconfig'

	-- For easy installation of LSPs
	use 'williamboman/mason.nvim'

	-- Bridging nvim-lspconfig and mason
	use 'williamboman/mason-lspconfig.nvim'

	-- Tagbar
	use 'preservim/tagbar'

	-- Commenting plugin
	use 'numToStr/Comment.nvim'

	-- Treesitter Syntax Highlighting
	use  { 'nvim-treesitter/nvim-treesitter', ['do'] = ':TSUpdate' }

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
