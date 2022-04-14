---------------
--  null-ls  --
---------------
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require('null-ls').setup({
  sources = {
    formatting.stylua,
    formatting.black,
    formatting.uncrustify,
    formatting.prettier,
    diagnostics.cppcheck,
  },
})
