---------------
--  null-ls  --
---------------
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require('null-ls').setup({
  on_init = function(new_client, _)
    new_client.offset_encoding = 'utf-32'
  end,
  sources = {
    formatting.stylua,
    formatting.black,
    formatting.prettier,
    formatting.qmlformat,
    -- diagnostics.cppcheck,
    diagnostics.qmllint,
    code_actions.gitsigns,
  },
})
