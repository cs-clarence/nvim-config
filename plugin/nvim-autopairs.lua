local autopairsOK, autopairs = pcall(require, "autopairs")
if not autopairsOK then
  vim.notify("Failed to require lualine")
  return
end

autopairs.setup({})
