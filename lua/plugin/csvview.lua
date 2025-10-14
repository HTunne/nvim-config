return {
  src = 'https://github.com/hat0uma/csvview.nvim',
  data = {
    after = function()
      require('csvview').setup()
    end,
    keys = {
      { '<leader>v', '<CMD>CsvViewToggle<CR>', mode = { 'n' }, desc = 'toggle csvview' },
    },
  },
}
