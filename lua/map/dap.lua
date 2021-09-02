local dap = require('dap')
local var = require('dap.ui.variables')
local widgets = require('dap.ui.widgets')
local tele = require('telescope')

return {
  name = '+dap',
  c = { dap.continue, 'continue' },
  v = { dap.step_over, 'step over' },
  i = { dap.step_into, 'step into' },
  o = { dap.step_out, 'step out' },
  b = { dap.toggle_breakpoint, 'toggle breakpoint' },

  u = {
    name = '+ui',
    s = { var.scopes, 'ui scopes' },
    h = { var.hover, 'ui hover' },
    v = { var.visual_hover, 'ui visual hover' },
  },

  w = {
    name = '+widgets',
    h = { widgets.hover, 'widgets hover' },
    s = {
      function() widgets.centered_float(widgets.scopes) end,
      'widgets scopes'
    }
  },

  s = {
    name = '+set breakpoint',
    r = {
      function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      'set conditional breakpoint'
    },
    m = {
      function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      'set breakpoint with log message'
    }
  },

  r = {
    name = '+repl',
    o = { dap.repl.open, 'repl open' },
    l = { dap.repl.run_last, 'repl run last' },
  },

-- telescope-dap
  t = {
    name = '+telescope-dap',
    c = {
      function() tele.extensions.dap.commands{} end,
      'telescope commands'
    },
    o = {
      function() tele.extensions.dap.configurations{} end,
      'telescope configurations'
    },
    b = {
      function() tele.extensions.dap.list_breakpoints{} end,
      'telescope breakpoints'
    },
    v = {
      function() tele.extensions.dap.variables{} end,
      'telescope variables'
    },
    f = {
      function() tele.extensions.dap.frames{} end,
      'telescope frames'
    },
  }
}
