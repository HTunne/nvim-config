return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'toggle breakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'continue',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'step into',
      },
      {
        '<leader>do',
        function()
          require('dap').step_out()
        end,
        desc = 'step out',
      },
      {
        '<leader>dv',
        function()
          require('dap').step_over()
        end,
        desc = 'step over',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = 'step into',
      },
      {
        '<leader>dq',
        function()
          require('dap').terminate() -- disconnect? close?
        end,
        desc = 'step over',
      },
      {
        '<leader>dr',
        function()
          require('dap').restart()
        end,
        desc = 'step over',
      },
      {
        '<leader>deo',
        function()
          require('dap').repl.open()
        end,
        desc = 'repl open',
      },
      {
        '<leader>del',
        function()
          require('dap').repl.run_last()
        end,
        desc = 'repl run last',
      },

      {
        '<leader>dsr',
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'set conditional breakpoint',
      },
      {
        '<leader>dsm',
        function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        desc = 'set breakpoint with log message',
      },
    },
    config = function()
      local dap = require('dap')

      local sign = vim.fn.sign_define

      sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
      sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb',
      }
      -- configurations
      local lldb = require('dbg-configs/lldb')
      dap.configurations.c = lldb
      dap.configurations.cpp = lldb
      dap.configurations.rust = lldb

      vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapLoaded' })

      local filetype, _ = vim.filetype.match({ buf = 0 })
      if filetype == 'python' then
        vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapPython' })
      elseif filetype == 'lua' then
        vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapLua' })
      end
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = true,
    event = 'User NvimDapLoaded',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
