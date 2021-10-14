return {
  name = '+lsp',
  ['<C-k>'] = { vim.lsp.buf.signature_help, 'signature help' },
  ['[d'] = { vim.lsp.diagnostic.goto_prev, 'go to previous diagnostic' },
  [']d'] = { vim.lsp.diagnostic.goto_next, 'go to next diagnostic' },
  g = {
    D = { vim.lsp.buf.declaration, '' },
    d = { vim.lsp.buf.definition, '' },
    i = { vim.lsp.buf.implementation, '' },
    r = { vim.lsp.buf.references, '' },
  },
  ['<leader>'] = {
    l = {
      name = '+lsp',
      D = { vim.lsp.buf.type_definition, 'type definition' },
      e = { vim.lsp.diagnostic.show_line_diagnostics, 'show line diagnostics' },
      f = { vim.lsp.buf.formatting, 'formatting' },
      h = { vim.lsp.buf.document_highlight, 'highlight' },
      K = { vim.lsp.buf.hover, '' },
      q = { vim.lsp.diagnostic.set_localist, 'set loclist' },
      r = { vim.lsp.buf.rename, 'rename' },
      w = {
        name = '+workspace',
        a = { vim.lsp.buf.add_workspace_folder, 'add folder' },
        l = {
          function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
          'list folders'
        },
        r = { vim.lsp.buf.remove_workspace_folder, 'remove folder' }
      }
    }
  }
}
