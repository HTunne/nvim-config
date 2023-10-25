return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  event = 'User NvimDapLoaded',
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
        require('dapui').widgets.centered_float(require('dapui').widgets.scopes)
      end,
      desc = 'scopes',
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end
  end,
}
