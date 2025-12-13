return {
  src = 'https://github.com/stevearc/quicker.nvim',
  data = {
    after = function()
      require('quicker').setup()
      vim.keymap.set('n', '<leader>qq', function()
        require('quicker').toggle()
      end, {
        desc = 'Toggle quickfix',
      })
      vim.keymap.set('n', '<leader>ql', function()
        require('quicker').toggle({ loclist = true })
      end, {
        desc = 'Toggle loclist',
      })
    end,
  },
}
