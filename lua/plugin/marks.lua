return {
  src = 'https://github.com/chentoast/marks.nvim',
  data = {
    after = function()
      require('marks').setup()
    end,
  },
}
