return {
  'jbyuki/one-small-step-for-vimkind',
  event = 'User NvimDapLua',
  keys = {
    {
      '<leader>dol',
      function()
        require('osv').launch()
      end,
      { desc = 'launch osv debugger' },
    },
    {
      '<leader>dor',
      function()
        require('osv').run_this()
      end,
      { desc = 'run osv debug' },
    },
    {
      '<leader>dos',
      function()
        require('osv').stop()
      end,
      { desc = 'stop dap server' },
    },
  },
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dap = require('dap')
    dap.adapters.nlua = function(callback, config)
      callback({ type = 'server', host = config.host, port = config.port })
    end
    dap.configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
        host = function()
          local value = vim.fn.input('Host [127.0.0.1]: ')
          if value ~= '' then
            return value
          end
          return '127.0.0.1'
        end,
        port = function()
          local val = tonumber(vim.fn.input('Port: '))
          assert(val, 'Please provide a port number')
          return val
        end,
      },
    }
  end,
}
