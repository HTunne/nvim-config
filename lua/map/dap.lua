return {
  name = '+dap',
  c = { require('dap').continue, 'continue' },
  v = { require('dap').step_over, 'step over' },
  i = { require('dap').step_into, 'step into' },
  o = { require('dap').step_out, 'step out' },
  b = { require('dap').toggle_breakpoint, 'toggle breakpoint' },

  sc = { require('dap.ui.variables').scopes, '' },
  hh = { require('dap.ui.variables').hover, '' },
  hv = { require('dap.ui.variables').visual_hover, '' },

  uh = { require('dap.ui.widgets').hover, '' },
  uf = {
    function() local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes) end,
    ''
  },
  sbr = {
    function() require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
    ''
  },
  sbm = {
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
    ''
  },
  ro = { require('dap').repl.open, '' },
  rl = { require('dap').repl.run_last, '' },
-- telescope-dap
  cc = {
    function() require('telescope').extensions.dap.commands{} end,
    ''
  },
  co = {
    function() require('telescope').extensions.dap.configurations{} end,
    ''
  },
  lb = {
    function() require('telescope').extensions.dap.list_breakpoints{} end,
    ''
  },
  tv = {
    function() require('telescope').extensions.dap.variables{} end,
    ''
  },
  f = {
    function() require('telescope').extensions.dap.frames{} end,
    ''
  },
}
