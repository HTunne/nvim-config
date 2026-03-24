return {
  src = 'https://github.com/stevearc/oil.nvim',
  data = {
    lazy = false,
    after = function()
      require('oil').setup()
    end,
    keys = {
      { '-', '<CMD>Oil<CR>', mode = { 'n' }, desc = 'Open parent directory' },
    },
    cmd = { 'Oil' },
  },
}
