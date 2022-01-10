local osv = require('osv')

return {
  name = '+one small step',
  l = { osv.launch, 'launch osv debugger' },
  r = { osv.run_this, 'run osv debug' },
  s = { osv.stop, 'stop dap server' },
}
