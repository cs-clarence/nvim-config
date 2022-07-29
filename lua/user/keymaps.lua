-- Create a copy of keymap function
local keymap = vim.keymap.set

local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Set Leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ToggleTerm keymaps
keymap("t", [[<ESC>]], [[<C-\><C-n>]], default_opts)

-- NvimToggleTree keymaps
keymap("n", [[<leader>tt]], [[:NvimTreeToggle<cr>]], default_opts)

-- Fzf Toggle
keymap("n", [[<leader>ff]], [[:Fzf files<cr>]], default_opts)
keymap("n", [[<leader>ft]], [[:Fzf tags<cr>]], default_opts)
keymap("n", [[<leader>fb]], [[:Fzf buffers<cr>]], default_opts)
keymap("n", [[<leader>fg]], [[:Fzf grep<cr>]], default_opts)
keymap("n", [[<leader>fr]], [[:Fzf git_files<cr>]], default_opts)

-- Better (?) window navigation
keymap("n", [[<C-k>]], [[<C-w>k]], default_opts)
keymap("n", [[<C-j>]], [[<C-w>j]], default_opts)
keymap("n", [[<C-l>]], [[<C-w>l]], default_opts)
keymap("n", [[<C-h>]], [[<C-w>h]], default_opts)

-- Better (?) window resize
keymap("n", [[<A-k>]], [[:resize -1<cr>]], default_opts)
keymap("n", [[<A-j>]], [[:resize +1<cr>]], default_opts)
keymap("n", [[<A-h>]], [[:vertical resize -1<cr>]], default_opts)
keymap("n", [[<A-l>]], [[:vertical resize +1<cr>]], default_opts)

-- Buffer traversal
keymap("n", [[<S-l>]], [[:bnext<cr>]], default_opts)
keymap("n", [[<S-h>]], [[:bprevious<cr>]], default_opts)

-- Toggle ToggleTerm
keymap("n", [[<leader>tr]], [[:ToggleTerm<cr>]], default_opts)

-- Tagbar
keymap("n", [[<leader>b]], [[:TagbarToggle<cr>]], default_opts)

-- Packer keymaps command
keymap("n", [[<leader>ps]], [[:PackerSync<cr>]], default_opts)
keymap("n", [[<leader>pu]], [[:PackerUpdate<cr>]], default_opts)

-- Trouble
keymap("n", [[<leader>dd]], [[:TroubleToggle<cr>]], default_opts)

-- Diagnostics

keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
keymap("n", "<leader>df", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
