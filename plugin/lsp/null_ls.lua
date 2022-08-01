local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
--
null_ls.setup({
  debug = false,
  sources = {
    formatting.prettierd,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.dart_format,
    formatting.gofmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.rustfmt,
    formatting.stylua,
    -- diagnostics.flake8
  },
})
