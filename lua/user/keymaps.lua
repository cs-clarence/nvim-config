local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true } 
local expr_opts = { noremap = true, expr = true, silent = true }

-- Use "jk" keybind to exit Terminal 
keymap("i", [[jk]], [[<ESC>]], default_opts)
keymap("t", [[jk]], [[<c-\><c-n>]], default_opts)
