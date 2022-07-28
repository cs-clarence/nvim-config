local lualineOk, lualine = pcall(require, "lualine")
if not lualineOk then
  vim.notify("Failed to require lualine")
  return
end

lualine.setup({})
