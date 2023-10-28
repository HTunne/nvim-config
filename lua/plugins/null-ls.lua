return {
  'jose-elias-alvarez/null-ls.nvim', -- sytlua, black, prettier, ccpcheck, qmllint, qmlformat
  enabled = false,
  ft = {
    'lua',
    'python',
    'javascript',
    'typescript',
    'javascriptreact',
    'json',
    'css',
    'scss',
    'less',
    'html',
    'vue',
    'angular',
    'graphql',
    'markdown',
    'yaml',
    'qml',
    'cmake',
  },
  config = function()
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
        formatting.cmake_format,
        -- diagnostics.cppcheck,
        diagnostics.qmllint,
        diagnostics.cmake_lint,
      },
    })
  end,
}
