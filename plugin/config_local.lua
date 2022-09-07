vim.o.exrc = false

local config_local_ok, config_local = pcall(require, "config-local")

if not config_local_ok then
  vim.notify("Failed to load config-local")
  return
end

config_local.setup({
  config_files = {
    ".nvimrc.lua",
    ".nvimrc",
    ".exrc.lua",
    ".exrc",
  },
  hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  silent = false, -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false, -- Lookup config files in parent directories
})
