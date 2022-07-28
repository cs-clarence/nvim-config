local require_ok, lualine = pcall(require, "lualine")
if not require_ok then
  vim.notify("Failed to require lualine")
  return
end

lualine.setup({})
