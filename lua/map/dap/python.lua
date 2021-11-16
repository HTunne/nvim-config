local dap_py = require('dap-python')

return {
  name = "+python",
  m = {
    dap_py.test_method,
    'test method'
  },
  c = {
    dap_py.test_class,
    'test class'
  },
  s = {
    dap_py.debug_selection,
    'debug selection'
  }
}
