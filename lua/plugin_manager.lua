local M = {}
local initialized = false
function M.init()
  if initialized then
    error("init() should be only called once")
  end

  local fn = vim.fn

  local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
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
    autocmd BufWritePost colorschemes.lua source <afile> | PackerSync
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
    local cs_list_ok, colorschemes = pcall(require, "user.colorschemes")
    if cs_list_ok then
      for _, colorscheme in pairs(colorschemes) do
        use(colorscheme)
      end
    end

    local cs_ok, colorscheme = pcall(require, "user.colorscheme")
    if cs_ok then
      local ok = pcall(vim.cmd, [[colorscheme ]] .. colorscheme)

      if not ok then
        vim.notify("Unable to set colorscheme " .. colorscheme .. ": not found")
      end
    end

    local plugins_ok, plugins = pcall(require, "user.plugins")
    if not plugins_ok then
      vim.notify("Failed to require plugins")
      return
    end

    for _, v in ipairs(plugins) do
      use(v)
    end

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end)
end

return M
