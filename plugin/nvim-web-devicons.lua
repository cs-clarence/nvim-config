local require_ok, nvimWebDevicons = pcall(require, "nvim-web-devicons")
if not require_ok then
  vim.notify("Failed to require nvim-web-devicons")
  return
end

nvimWebDevicons.setup()
