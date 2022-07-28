local nvimTreeOk, nvimTree = pcall(require, "nvim-tree")
if not nvimTreeOk then
  vim.notify("Failed to require nvim-tree")
  return
end

nvimTree.setup({
  sort_by = "case_sensitive",
  reload_on_bufenter = true,
  open_on_setup_file = true,
  open_on_setup = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  view = {
    side = "left",
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = "icon",
  },
  filters = {
    dotfiles = true,
  },
})
