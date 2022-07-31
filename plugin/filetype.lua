local filetype_ok, filetype = pcall(require, "filetype")
if not filetype_ok then
  vim.notify("Failed to require filetype")
  return
end

local user_has_custom_filetypes, user_filetypes =
  pcall(require, "user.filetypes")
if not user_has_custom_filetypes then
  user_filetypes = {}
end

filetype.setup(user_filetypes)
