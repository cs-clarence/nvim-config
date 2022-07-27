require('nvim-tree').setup {
  sort_by = "case_sensitive",
	reload_on_bufenter = true,
	sync_root_with_cwd = true,
  view = {
		side = "left",
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

