local require_ok, toggleTerm = pcall(require, "toggleterm")
if not require_ok then
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
