local dap = require('dap')
local widgets = require('dap.ui.widgets')

return {
  name = '+dap',
  b = { dap.toggle_breakpoint, 'toggle breakpoint' },
  c = { dap.continue, 'continue' },
  i = { dap.step_into, 'step into' },
  o = { dap.step_out, 'step out' },
  v = { dap.step_over, 'step over' },

  r = {
    name = '+repl',
    o = { dap.repl.open, 'repl open' },
    l = { dap.repl.run_last, 'repl run last' },
  },

  s = {
    name = '+set breakpoint',
    r = {
      function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      'set conditional breakpoint',
    },
    m = {
      function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end,
      'set breakpoint with log message',
    },
  },

  w = {
    name = '+widgets',
    h = { widgets.hover, 'widgets hover' },
    s = {
      function()
        widgets.centered_float(widgets.scopes)
      end,
      'widgets scopes',
    },
  },

  n = require('map/dap/osv'),
  p = require('map/dap/python'),
  t = require('map/dap/telescope'),
}
