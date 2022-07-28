local lspconfigOk, lc = pcall(require, "lspconfig")

if not lspconfigOk then
  vim.notify("Failed to require lspconfig")
  return
end

-- Setup Handlers
local handlersOk, handlers = pcall(require, "plugin.lsp.handlers")
if not handlersOk then
  vim.notify("Failed to load handlers")
  return
end
handlers.setup()

local masonOk, mason = pcall(require, "mason")
if not masonOK then
  vim.notify("Failed to load mason")
  return
end
mason.setup()

local masonLspConfigOk, masonLspConfig = pcall(require, "mason-lspconfig")
if not masonLspConfigOk then
  vim.notify("Failed to load mason-lspconfg")
  return
end
masonLspConfig.setup()

masonLspConfig.setup_handlers({
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    lc[server_name].setup({
      capabilities = handlers.capabilities,
      on_attach = handers.on_attach,
    })
  end,
})
