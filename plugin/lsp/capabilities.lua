local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmpNvimLspOk, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if not cmpNvimLspOk then
  return
end

local capabilities = cmpNvimLsp.update_capabilities(capabilities)

return capabilities
