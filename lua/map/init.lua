-----------
--  map  --
-----------
local wk = require("which-key")

wk.register({
  c =  { '<cmd>nog<CR>', 'clear highlights' },
  o =  { 'm`o<Esc>0D``', 'newline below' },
  s =  { '<cmd>set spell spelllang=en_gb<CR>', 'set spell' },
  e =  { '<cmd>NvimTreeToggle<CR>', 'open nvim tree' },
  w = {
    name = '+vimwiki',
    w = 'Vimwiki Index',
    i = 'Vimwiki Diary Index',
    t = 'Vimwiki Tab Index',
    s = 'Vimwiki UI Select ',
    SPC = {
      name = '+diary',
      i = 'Vimwiki Diary Generate Links',
      t = 'Vimwiki Tab Make Diary Note',
      y = 'Vimwiki Make Yesterday Diary Note',
      m = 'Vimwiki Make Tomorrow Diary Note',
      w = 'Vimwiki Make Diary Note',
    },
  },
  l = {
    name = '+lsp',
    D = { vim.lsp.buf.type_definition, 'type definition' },
    r = { vim.lsp.buf.rename, 'rename' },
    e = { vim.lsp.diagnostic.show_line_diagnostics, 'show line diagnostics' },
    q = { vim.lsp.diagnostic.set_localist, 'set loclist' },
    f = { vim.lsp.buf.formatting, 'formatting' },
    h = { vim.lsp.buf.document_highlight, 'highlight' },
    w = {
      name = '+workspace',
      a = { vim.lsp.buf.add_workspace_folder, 'add folder' },
      r = { vim.lsp.buf.remove_workspace_folder, 'remove folder' },
      l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list folders' },
    },
  },
  p = {
    name = '+telescope',
    p = { require('telescope.builtin').git_files, 'find files in git repo' },
    f = { require('telescope.builtin').find_files, 'find files' },
    g = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")}) end, 'grep over files' },
    w = { require('telescope.builtin').grep_string, 'find current word' },
  },
  j = {
    name = '+jupyter',
    C = { '<cmd>JupyterConnect<CR>', 'jupyter connect' },
    R = { '<cmd>JupyterRunFile<CR>', 'jupyter run file' },
    I = { '<cmd>PythonImportThisFile<CR>', 'jupyter import this file' },
    d = { '<cmd>JupyterCd %:p:h<CR>', 'jupyter cd to cwd' },
    j = { '<cmd>JupyterSendCell<CR>', 'jupyter send cell' },
    E = { '<cmd>JupyterSendRange<CR>', 'jupyter send range' },
    U = { '<cmd>JupyterUpdateShell<CR>', 'jupyter update shell' },
  }
}, { prefix = "<leader>" })
