return {
  name = '+lsp',
  ['<C-k>'] = { vim.lsp.buf.signature_help, 'display signature information' },
  ['[d'] = { vim.lsp.diagnostic.goto_prev, 'go to previous diagnostic' },
  [']d'] = { vim.lsp.diagnostic.goto_next, 'go to next diagnostic' },
  g = {
    D = { vim.lsp.buf.declaration, 'jump to declaration' },
    d = { vim.lsp.buf.definition, 'jump to definition' },
    i = { vim.lsp.buf.implementation, 'list implementations' },
    r = { vim.lsp.buf.references, 'list references' },
  },
  ['<leader>'] = {
    l = {
      name = '+lsp',
      D = { vim.lsp.buf.type_definition, 'jump to type definition' },
      e = { vim.lsp.diagnostic.show_line_diagnostics, 'show line diagnostics' },
      f = { vim.lsp.buf.formatting, 'format current buffer' },
      h = { vim.lsp.buf.document_highlight, 'highlight' },
      K = { vim.lsp.buf.hover, 'display hover info' },
      q = { vim.lsp.diagnostic.set_loclist, 'set location list' },
      r = { vim.lsp.buf.rename, 'rename all references' },
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
