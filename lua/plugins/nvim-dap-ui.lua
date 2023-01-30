return {
  'rcarriga/nvim-dap-ui',
  dependancies = {
    'mfussenegger/nvim-dap',
  },
  keys = {
    {
      '<leader>du',
      function()
        require('dapui').toggle()
      end,
      desc = 'toggle dap ui',
    },
    {
      '<leader>dh',
      function()
        require('dapui').widgets.hover()
      end,
      desc = 'hover',
    },
    {
      '<leader>ds',
      function()
        require('dapui').widgets.centered_float(widgets.scopes)
      end,
      desc = 'scopes',
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
  end,
}
