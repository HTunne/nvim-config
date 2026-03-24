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
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Daily', function(args)
      -- print(vim.inspect(args))
      client:exec_cmd({
        title = 'Daily',
        command = 'jump',
        arguments = { args.args },
      }, { bufnr = bufnr }, function(err, result)
        if err ~= nil then
          vim.api.nvim_echo({ { 'markdown-oxide jump error\n' }, { err.message } }, true, {})
          return
        end
        if result ~= nil then
          vim.api.nvim_echo({ { vim.inspect(result) } }, false, {})
        end
      end)
    end, { desc = 'Open daily note', nargs = '*' })
    vim.keymap.set('n', '<leader>nt', '<cmd>Daily today<cr>', { desc = 'open todays daily note' })
    vim.keymap.set('n', '<leader>nm', '<cmd>Daily tomorrow<cr>', { desc = 'open tomorrows daily note' })
    vim.keymap.set('n', '<leader>ny', '<cmd>Daily yesterday<cr>', { desc = 'open yesterdays daily note' })
  end,
}
