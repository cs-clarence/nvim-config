local plugins = {
  -- Packer can manage itself
  "wbthomason/packer.nvim",

  -- Some dependencies for other packages
  "nvim-lua/plenary.nvim",

  -- Fzf, a fancy fuzzy finder
  "ibhagwan/fzf-lua",

  -- Lualine Plugin, for the status line at the bottom
  "nvim-lualine/lualine.nvim",

  -- For file icons
  "kyazdani42/nvim-web-devicons",

  -- Nvim-Tree, the file manager on the side
  "kyazdani42/nvim-tree.lua",

  -- ToggleTerm
  "akinsho/toggleterm.nvim",

  -- Code Completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/nvim-cmp",
  "f3fora/cmp-spell",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-nvim-lua",
  "uga-rosa/cmp-dictionary",

  -- Snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Tagbar
  "preservim/tagbar",

  -- Comment
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Trouble
  "folke/trouble.nvim",

  -- Neoformat
  "sbdchd/neoformat",

  -- TreeSitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "p00f/nvim-ts-rainbow",

  -- Autopairs
  "windwp/nvim-autopairs",

  -- Gitsigns
  "lewis6991/gitsigns.nvim",

  -- Bufferline, for displaying buffers (AKA Tabs in other editors like vs code)
  "akinsho/bufferline.nvim",

  -- Impatient, for faster nvim loading, apparently
  "lewis6991/impatient.nvim",

  -- Indent Blacklines, to show indent lines
  "lukas-reineke/indent-blankline.nvim",
}

local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autocmd BufWritePost colorscheme_list.lua source <afile> | PackerSync
    autocmd BufWritePost colorscheme.lua source <afile> | PackerSync
  augroup end
]])

local requireOk, packer = pcall(require, "packer")
if not requireOk then
  vim.notify("Couldn't require packer")
  return
end

-- Packer should display itself as a floating window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float()
    end,
  },
})

packer.startup(function(default_use)
  local function use(plugin)
    local use_ok = pcall(default_use, plugin)
    if not use_ok then
      if type(plugin) == "string" then
        vim.notify("Plugin " .. plugin .. " failed to install")
      elseif type(plugin) == "table" then
        vim.notify("Plugin " .. plugin[1] .. " failed to install")
      else
        vim.notify("A plugin has failed to install")
      end
    end
  end

  -- Colorschemes
  -- Install all the colorschemes specified by user
  local csListOk, colorschemes = pcall(require, "user.colorscheme_list")
  if csListOk then
    for index, colorscheme in pairs(colorschemes) do
      use(colorscheme)
    end
  end

  local csOk, colorscheme = pcall(require, "user.colorscheme")
  if csOk then
    local ok = pcall(vim.cmd, [[colorscheme ]] .. colorscheme)

    if not ok then
      vim.notify("Unable to set colorscheme " .. colorscheme .. ": not found")
    end
  end

  for k, v in ipairs(plugins) do
    use(v)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
