-- TODO: Setup neotest
local neotest_ok, neotest = pcall(require, "neotest")
if not neotest_ok then
  vim.notify("Failed to require neotest")
  return
end

neotest.setup({})
