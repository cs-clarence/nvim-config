local default_sources_ok, default_sources =
  pcall(require, "user.null_ls_sources")

if not default_sources_ok then
  vim.notify("Failed to load null_ls_sources")
  return
end

local M = {}

function M.config_with_sources(sources)
  default_sources.add_sources(table.unpack(sources))
end

return M
