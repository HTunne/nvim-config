return {
  name = '+jupyter',
  C = { '<cmd>JupyterConnect<CR>', 'jupyter connect' },
  R = { '<cmd>JupyterRunFile<CR>', 'jupyter run file' },
  I = { '<cmd>PythonImportThisFile<CR>', 'jupyter import this file' },
  d = { '<cmd>JupyterCd %:p:h<CR>', 'jupyter cd to cwd' },
  j = { '<cmd>JupyterSendCell<CR>', 'jupyter send cell' },
  E = { '<cmd>JupyterSendRange<CR>', 'jupyter send range' },
  U = { '<cmd>JupyterUpdateShell<CR>', 'jupyter update shell' },
}
