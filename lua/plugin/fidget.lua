return {
  src = 'https://github.com/j-hui/fidget.nvim',
  data = {
    after = function()
      require('fidget').setup()
    end,
  },
}
