local keymap = vim.keymap.set

local function on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufOpts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gD", vim.lsp.buf.declaration, bufOpts)
  keymap("n", "gd", vim.lsp.buf.definition, bufOpts)
  keymap("n", "K", vim.lsp.buf.hover, bufOpts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufOpts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufOpts)
  keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufOpts)
  keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufOpts)
  keymap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
  end, bufOpts)
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufOpts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, bufOpts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufOpts)
  keymap("n", "gr", vim.lsp.buf.references, bufOpts)
  keymap("n", "<leader>f", vim.lsp.buf.formatting, bufOpts)
end

return on_attach
