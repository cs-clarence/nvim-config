local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Use "<ESC>" keybind to exit Terminal 
keymap("t", [[<ESC>]], [[<c-\><c-n>]], default_opts)
