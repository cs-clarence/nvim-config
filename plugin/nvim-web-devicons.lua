local nvimWebDevIconsOk, nvimWebDevicons = pcall(require, "nvim-web-devicons")
if not nvimWebDevIconsOk then
  vim.notify("Failed to require nvim-web-devicons")
  return
end

nvimWebDevicons.setup()
