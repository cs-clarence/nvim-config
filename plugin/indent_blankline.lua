local indentBlankLineOk, indentBlankLine = pcall(require, "indent_blankline")
if not indentBlankLine then
  vim.notify("Failed to require indent_blankline")
  return
end

indentBlankLine.setup({
  show_end_of_line = true,
})
