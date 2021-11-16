local tele = require('telescope')

return {
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
