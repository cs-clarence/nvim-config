-- Set custom filetypes
local config = {
  overrides = {
    -- Set for file extensions
    extensions = {
      gotmpl = "gotmpl",
    },
    -- Set for specific filenames
    literal = {},
    -- Set the filetype of any full filename matching the regex
    complex = {},
    -- These are same as above but gets the values from return of the functions
    function_extensions = {},
    function_literal = {},
    function_complex = {
      [".+.go%w+"] = function()
        local filename = vim.fn.expand("%")
        local pattern = ".+.go(%w+)"
        local _, _, filetype = string.find(filename, pattern)
        vim.bo.filetype = filetype
      end,
    },

    -- Set for hashbang/shebang on type of the file
    shebang = {},
  },
}

-- vim.cmd([[
--   autocmd BufNewFile,BufRead *.go* if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
-- ]])

return config
