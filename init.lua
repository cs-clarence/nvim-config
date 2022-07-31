-- Tell neovim to not load the default filetypes
vim.g.did_load_filetypes = 1

-- Initialize the plugins first
require("plugin_manager").init()

-- Run other vim specific options
require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.autocmd")
