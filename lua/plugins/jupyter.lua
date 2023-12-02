return {
  'jupyter-vim/jupyter-vim',
  enabled = false,
  keys = {
    { '<leader>yc', '<cmd>JupyterConnect<CR>', desc = 'jupyter connect' },
    { '<leader>yr', '<cmd>JupyterRunFile<CR>', desc = 'jupyter run file' },
    { '<leader>yi', '<cmd>PythonImportThisFile<CR>', desc = 'jupyter import this file' },
    { '<leader>yd', '<cmd>JupyterCd desc = %:p:h<CR>', 'jupyter cd to cwd' },
    { '<leader>yj', '<cmd>JupyterSendCell<CR>', desc = 'jupyter send cell' },
    { '<leader>ye', '<cmd>JupyterSendRange<CR>', desc = 'jupyter send range' },
    { '<leader>yu', '<cmd>JupyterUpdateShell<CR>', desc = 'jupyter update shell' },
  },
}
