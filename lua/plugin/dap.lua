return {
  src = 'https://github.com/mfussenegger/nvim-dap',
  data = {
    after = function()
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

      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '-i', 'dap' },
      }

      -- configurations
      -- local lldb = require('dbg-configs/lldb')
      -- local gdb = require('dbg-configs/gdb')
      -- dap.configurations.c = lldb
      -- dap.configurations.cpp = lldb
      -- dap.configurations.rust = lldb

      vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapLoaded' })

      local filetype, _ = vim.filetype.match({ buf = 0 })
      if filetype == 'python' then
        vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapPython' })
      elseif filetype == 'lua' then
        vim.api.nvim_exec_autocmds('User', { pattern = 'NvimDapLua' })
      end
    end,
    keys = {
      {
        lhs = '<leader>db',
        rhs = function()
          require('dap').toggle_breakpoint()
        end,
        mode = { 'n' },
        desc = 'toggle breakpoint',
      },
      {
        lhs = '<leader>dc',
        rhs = function()
          require('dap').continue()
        end,
        mode = { 'n' },
        desc = 'continue',
      },
      {
        lhs = '<leader>di',
        rhs = function()
          require('dap').step_into()
        end,
        mode = { 'n' },
        desc = 'step into',
      },
      {
        lhs = '<leader>do',
        rhs = function()
          require('dap').step_out()
        end,
        mode = { 'n' },
        desc = 'step out',
      },
      {
        lhs = '<leader>dv',
        rhs = function()
          require('dap').step_over()
        end,
        mode = { 'n' },
        desc = 'step over',
      },
      {
        lhs = '<leader>dp',
        rhs = function()
          require('dap').pause()
        end,
        mode = { 'n' },
        desc = 'step into',
      },
      {
        lhs = '<leader>dq',
        rhs = function()
          require('dap').terminate() -- disconnect? close?
        end,
        mode = { 'n' },
        desc = 'step over',
      },
      {
        lhs = '<leader>dr',
        rhs = function()
          require('dap').restart()
        end,
        mode = { 'n' },
        desc = 'step over',
      },
      {
        lhs = '<leader>deo',
        rhs = function()
          require('dap').repl.open()
        end,
        mode = { 'n' },
        desc = 'repl open',
      },
      {
        lhs = '<leader>del',
        rhs = function()
          require('dap').repl.run_last()
        end,
        mode = { 'n' },
        desc = 'repl run last',
      },
      {
        lhs = '<leader>dsr',
        rhs = function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        mode = { 'n' },
        desc = 'set conditional breakpoint',
      },
      {
        lhs = '<leader>dsm',
        rhs = function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        mode = { 'n' },
        desc = 'set breakpoint with log message',
      },
    },
  },
}
