-----------
--  map  --
-----------
--
-- normal mode mappings
vim.keymap.set('n', 'Y', 'y$', { desc = 'yank to end of line' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'centre after n' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'centre after N' })
vim.keymap.set('n', '<leader>c', '<cmd>noh<CR>', { desc = 'clear highlights' })
vim.keymap.set('n', '<leader>j', ':m .+1<cr>==', { desc = 'move line down' })
vim.keymap.set('n', '<leader>k', ':m .-2<cr>==', { desc = 'move line up' })
vim.keymap.set('n', '<leader>o', 'm`o<Esc>0D``', { desc = 'newline below' })
vim.keymap.set('n', '<leader>f', function()
  if vim.opt.foldcolumn:get() == '1' then
    vim.opt.foldcolumn = '0'
  else
    vim.opt.foldcolumn = '1'
  end
end, { desc = 'toggle foldcolumn' })

-- insert mode mappings
vim.keymap.set('i', ',', ',<c-g>u', { desc = 'set undo breakpoint on ,' })
vim.keymap.set('i', '.', '.<c-g>u', { desc = 'set undo breakpoint on .' })
vim.keymap.set('i', '!', '!<c-g>u', { desc = 'set undo breakpoint on !' })
vim.keymap.set('i', '?', '?<c-g>u', { desc = 'set undo breakpoint on ?' })

-- visual mode
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'move highlighted region down' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'move highlighted region up' })

-- quickfix
--[[
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'go to previous quickfix item' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'go to next quickfix item' })

vim.keymap.set('n', '<leader>q', function()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    print(win)
    local num = vim.api.nvim_win_get_buf(win)
    print(num)
    print(vim.api.nvim_win_get_buf(win))
    print(vim.api.nvim_buf_get_option(num, "buftype"))
    if vim.api.nvim_buf_get_option(num, "buftype") == "quickfix" then
      vim.exec('cclose')
    end
  end
end, { desc = 'toggle quickfix window' })
]]--

-- diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next diagnostic' })
vim.keymap.set('n', '<leader>ie', vim.diagnostic.open_float, { desc = 'show diagnostic' })
vim.keymap.set('n', '<leader>iq', vim.diagnostic.setloclist, { desc = 'set location list' })

-- lsp
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'jump to declaration' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'jump to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'display hover info' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'list implementations' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'display signature info' })
vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, { desc = 'add workspace folder' })
vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { desc = 'remove workspace folder' })
vim.keymap.set('n', '<leader>lwl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = 'list workspace folders' })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, { desc = 'jump to type definition' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'rename all references' })
vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { desc = 'code action' })
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.document_highlight, { desc = 'highlight' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'list references' })
vim.keymap.set('n', '<leader>lf', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'format current buffer' })
