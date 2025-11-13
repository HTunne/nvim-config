return {
  src = 'https://github.com/catgoose/nvim-colorizer.lua',
  data = {
    after = function()
      require('colorizer').setup()
    end,
  },
}
