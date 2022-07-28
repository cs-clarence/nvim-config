local gitsignsOk, gitsigns = pcall(require, "gitsigns")
if not gitsignsOk then
  vim.notify("Failed to load gitsigns")
  return
end

gitsigns.setup({})
