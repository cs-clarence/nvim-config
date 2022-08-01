local nvim_treesitter_configs_ok, nvim_treesitter_configs =
  pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_configs_ok then
  vim.notify("Failed to require nvim-treesitter.configs")
  return
end

nvim_treesitter_configs.setup({
  auto_install = true, -- auto install parsers when entering a buffer
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  auto_pairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  context_commentstring = {
    enable_autocmd = false, -- Not sure what this is for
    enable = true,
  },
})
