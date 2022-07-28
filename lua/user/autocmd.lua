vim.cmd([[
	autocmd BufWritePre * undojoin | Neoformat
]])
