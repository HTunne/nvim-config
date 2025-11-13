return {
  src = 'https://github.com/lukas-reineke/indent-blankline.nvim',
  data = {
    after = function()
      require('ibl').setup()
    end,
  },
}
