local function keymap(...)
	vim.keymap.set(...)
end

local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- ToggleTerm keymaps
keymap('t', [[<ESC>]], [[<C-\><C-n>]], default_opts)

-- NvimToggleTree keymaps
keymap('n', [[<leader>r]], [[:NvimTreeToggle<cr>]], default_opts)

-- Fzf Toggle
keymap('n', [[<leader>f]], [[:Files<cr>]], default_opts)

-- Tagbar
keymap('n', [[<leader>b]], [[:TagbarToggle<cr>]], default_opts)
