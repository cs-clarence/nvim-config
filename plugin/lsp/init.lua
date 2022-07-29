local lspconfigOk, lc = pcall(require, "lspconfig")
if not lspconfigOk then
  vim.notify("Failed to require lspconfig")
  return
end

-- Setup Handlers
local capabilitiesOk, capabilities = pcall(require, "plugin.lsp.capabilities")
if not capabilitiesOk then
  vim.notify("Failed to load capabilities")
  return
end --

-- Setup Handlers
local onAttachOk, onAttach = pcall(require, "plugin.lsp.on_attach")
if not onAttachOk then
  vim.notify("Failed to load on_attach")
  return
end --

local mason = require("mason")

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
      capabilities = capabilities,
      on_attach = onAttach,
    })
  end,
})
