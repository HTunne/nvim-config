return {
  'mfussenegger/nvim-dap-python',
  event = 'User NvimDapPython',
  keys = {
    {
      '<leader>dpm',
      function()
        require('dap-python').test_method()
      end,
      { desc = 'test method' },
    },
    {
      '<leader>dpc',
      function()
        require('dap-python').test_class()
      end,
      { desc = 'test class' },
    },
    {
      '<leader>dps',
      function()
        require('dap-python').debug_selection()
      end,
      { desc = 'debug selection' },
    },
  },
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dap_py = require('dap-python')
    dap_py.setup('python')
    dap_py.test_runner = 'pytest'
  end,
}
