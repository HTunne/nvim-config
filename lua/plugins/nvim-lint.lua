return {
  'mfussenegger/nvim-lint',
  ft = { 'bash', 'cmake', 'lua', 'sh', 'python' },
  config = function()
    require('lint').linters_by_ft = {
      cmake = {
        'cmake_lint',
      },
      lua = {
        'selene',
      },
      python = {
        'vulture',
      },
    }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
