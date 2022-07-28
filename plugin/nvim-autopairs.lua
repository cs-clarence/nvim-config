local nvimAutopairsOK, autopairs = pcall(require, "nvim-autopairs")
if not nvimAutopairsOK then
  vim.notify("Failed to require nvim-autopairs")
  return
end

autopairs.setup()
