local trouble_ok, trouble = pcall(require, "trouble")
if not trouble_ok then
  vim.notify("Failed to require trouble")
  return
end

trouble.setup({})
