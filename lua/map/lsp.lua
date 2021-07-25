return {
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
    l = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      'list folders'
    },
  },
}
