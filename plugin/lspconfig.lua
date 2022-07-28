local require_ok, lc = pcall(require, "lspconfig")

if not require_ok then
  vim.notify("Failed to require lspconfig")
  return
end

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require("mason").setup()
local masonLspConfig = require("mason-lspconfig")

masonLspConfig.setup()

masonLspConfig.setup_handlers({
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    lc[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
