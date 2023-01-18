-----------
--  dbg  --
-----------
local dap = require('dap')
local dapui = require('dapui')

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

-- ui
dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

-- telescope
require('telescope').load_extension('dap')

-- adapters
dap.adapters.nlua = require('dbg/adapters/nlua')
dap.adapters.lldb = require('dbg/adapters/lldb')

-- configurations
dap.configurations.lua = require('dbg/configurations/lua')
local lldb = require('dbg/configurations/lldb')
dap.configurations.c = lldb
dap.configurations.cpp = lldb
dap.configurations.rust = lldb
dap.configurations.python = require('dbg/configurations/flask')

-- python
require('dap-python').setup('/home/h/.local/share/virtualenvs/task-rest-SL2EhAL0/bin/python')
require('dap-python').test_runner = 'pytest'
