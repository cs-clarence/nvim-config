-- Set custom filetypes
local overrides = {
  -- Set for file extensions
  extensions = {},
  -- Set for filenames
  literal = {},
  -- Set the filetype of any full filename matching the regex
  complex = {},
  -- These are same as above but gets the values from return of the functions
  function_extensions = {},
  function_literal = {},
  function_complex = {},

  -- Set for hashbang/shebang on type of the file
  shebang = {},
}

return overrides
