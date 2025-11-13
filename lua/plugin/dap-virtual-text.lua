return {
  src = 'https://github.com/theHamsta/nvim-dap-virtual-text',
  data = {
    after = function()
      require('lua.plugin.dap-virtual-text').setup()
    end,
    event = 'User NvimDapLoaded',
  },
}
