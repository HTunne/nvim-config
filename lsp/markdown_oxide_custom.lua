---@brief
---
--- https://github.com/Feel-ix-343/markdown-oxide
---
--- Editor Agnostic PKM: you bring the text editor and we
--- bring the PKM.
---
--- Inspired by and compatible with Obsidian.
---
--- Check the readme to see how to properly setup.

---@type vim.lsp.Config
return {
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  filetypes = { 'markdown' },
  cmd = { 'markdown-oxide' },
  capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  }),
  on_attach = function(_, _)
    vim.api.nvim_create_user_command('Daily', function(args)
      vim.lsp.buf.execute_command({ command = 'jump', arguments = { args.args } })
    end, { desc = 'Open daily note', nargs = '*' })
    vim.keymap.set('n', '<leader>nt', function()
      vim.lsp.buf.execute_command({ command = 'jump', arguments = { 'today' } })
    end, { desc = 'open todays daily note' })
    vim.keymap.set('n', '<leader>nm', function()
      vim.lsp.buf.execute_command({ command = 'jump', arguments = { 'tomorrow' } })
    end, { desc = 'open tomorrows daily note' })
    vim.keymap.set('n', '<leader>ny', function()
      vim.lsp.buf.execute_command({ command = 'jump', arguments = { 'yesterday' } })
    end, { desc = 'open yesterdays daily note' })
  end,
}
