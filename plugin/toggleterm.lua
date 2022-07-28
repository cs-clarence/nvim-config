local toggelTermOk, toggleTerm = pcall(require, "toggleterm")
if not toggelTermOk then
  vim.notify("Failed to require toggleterm")
  return
end

toggleTerm.setup({
  -- open_mapping = [[<leader>tr]],
  insert_mappings = true,
  terminal_mappings = true,
  hide_numbers = true,
  direction = "float",
})
