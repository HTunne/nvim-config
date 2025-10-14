-- normal mode mappings
vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', 'Y', 'y$', { desc = 'yank to end of line' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'centre after n' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'centre after N' })
vim.keymap.set('n', '<esc>', '<cmd>noh<CR>', { desc = 'clear highlights' })
vim.keymap.set('n', '<leader>j', ':m .+1<cr>==', { desc = 'move line down' })
vim.keymap.set('n', '<leader>k', ':m .-2<cr>==', { desc = 'move line up' })
vim.keymap.set('n', '<leader>o', 'm`o<Esc>0D``', { desc = 'newline below' })

-- insert mode mappings
vim.keymap.set('i', ',', ',<c-g>u', { desc = 'set undo breakpoint on ,' })
vim.keymap.set('i', '.', '.<c-g>u', { desc = 'set undo breakpoint on .' })
vim.keymap.set('i', '!', '!<c-g>u', { desc = 'set undo breakpoint on !' })
vim.keymap.set('i', '?', '?<c-g>u', { desc = 'set undo breakpoint on ?' })

-- visual mode
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'move highlighted region down' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'move highlighted region up' })

-- terminal mode mappings
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'exit terminal mode' })

-- diagnostic
vim.keymap.set('n', '<leader>ie', vim.diagnostic.open_float, { desc = 'show diagnostic' })
vim.keymap.set('n', '<leader>iq', vim.diagnostic.setloclist, { desc = 'set location list' })

-- lsp
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function()
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'jump to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'jump to definition' })
    vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, { desc = 'add workspace folder' })
    vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { desc = 'remove workspace folder' })
    vim.keymap.set('n', '<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'list workspace folders' })
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.document_highlight, { desc = 'highlight' })
    vim.keymap.set('n', '<leader>lp', function()
      vim.lsp.buf.format({ async = true })
    end, { desc = 'format current buffer' })
    vim.keymap.set('n', '<leader>ls', '<cmd>LspClangdSwitchSourceHeader<cr>', { desc = 'switch source/header' })
    vim.keymap.set('n', '<leader>lt', '<cmd>LspClangdShowSymbolInfo<cr>', { desc = 'show type heirachy' })
  end,
})
