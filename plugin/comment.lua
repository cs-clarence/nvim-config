local commentOk, comment = pcall(require, "Comment")

if not commentOk then
  vim.notify("Failed to require cmp")
  return
end

comment.setup({})
