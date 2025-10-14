return {
  src = 'https://github.com/stevearc/oil.nvim',
  data = {
    after = function()
      require('oil').setup()
    end,
    keys = {
      { '-', '<CMD>Oil<CR>', mode = { 'n' }, desc = 'Open parent directory' },
    },
    cmd = 'Oil',
  },
}
