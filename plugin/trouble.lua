local troubleOk, trouble = pcall(require, "trouble")
if not troubleOk then
  vim.notify("Failed to require trouble")
  return
end

trouble.setup({})
