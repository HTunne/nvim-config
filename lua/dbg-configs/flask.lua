return {
  name = 'Flask',
  type = 'python',
  request = 'launch',
  stopOnEntry = false,
  pythonPath = '${config:python.pythonPath}',
  program = 'flask',
  env = {
    FLASK_APP = '${workspaceRoot}/quickstart/app.py',
  },
  args = {
    'run',
    '--no-debugger',
    '--no-reload',
  },
  envFile = '${workspaceFolder}/.env',
  debugOptions = {
    'WaitOnAbnormalExit',
    'WaitOnNormalExit',
    'RedirectOutput',
  },
}
