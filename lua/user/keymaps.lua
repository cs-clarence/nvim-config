local function keymap(...)
	vim.keymap.set(...)
end

local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Set Leader key to space
vim.g.mapleader = ' '

-- ToggleTerm keymaps
keymap('t', [[<ESC>]], [[<C-\><C-n>]], default_opts)

-- NvimToggleTree keymaps
keymap('n', [[<leader>tt]], [[:NvimTreeToggle<cr>]], default_opts)

-- Fzf Toggle
keymap('n', [[<leader>ff]], [[:Fzf files<cr>]], default_opts)
keymap('n', [[<leader>ft]], [[:Fzf tags<cr>]], default_opts)
keymap('n', [[<leader>fb]], [[:Fzf buffers<cr>]], default_opts)
keymap('n', [[<leader>fg]], [[:Fzf grep<cr>]], default_opts)
keymap('n', [[<leader>fr]], [[:Fzf git_files<cr>]], default_opts)

-- Tagbar
keymap('n', [[<leader>b]], [[:TagbarToggle<cr>]], default_opts)

-- Packer sync command
keymap('n', [[<leader>pks]], [[:PackerSync<cr>]], default_opts)
