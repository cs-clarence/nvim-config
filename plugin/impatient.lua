-- Config for luasnip goes like this, instead of a setup function
__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath("cache") .. "/luacache_chunks",
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
  },
}

local impatientOk, impatient = pcall(require, "impatient")
if not impatientOk then
  vim.notify("Failed to require impatient")
  return
end
