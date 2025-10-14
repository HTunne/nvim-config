return {
  src = 'https://github.com/mfussenegger/nvim-lint',
  data = {
    after = function()
      require('lint').linters_by_ft = {
        cmake = {
          'cmakelint',
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
  },
}
