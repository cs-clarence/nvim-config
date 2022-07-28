local require_ok, comment = pcall(require, "Comment")

if not require_ok then
  vim.notify("Failed to require cmp")
  return
end

comment.setup({})
