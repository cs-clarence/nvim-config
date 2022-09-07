local cs_ok, cs = pcall(require, "user.colorscheme")

if not cs_ok then
  vim.notify("Failed to load user.colorscheme")
  return
end

local M = {}
M.install = cs.install
M.set_active = cs.set_active
return M
