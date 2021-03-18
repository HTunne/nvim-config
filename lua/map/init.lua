-----------
--  map  --
-----------

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>0D``')
map('n', '<leader>s', '<cmd>set spell spelllang=en_gb<CR>')
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- lsp
map('n', '<Leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<CR>")
map('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

-- telescope
map('n', '<leader>pp', [[<cmd>lua require('telescope.builtin').git_files()<cr>]])
map('n', '<leader>pf', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
map('n', '<leader>pg', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<cr>]])
map('n', '<leader>pw', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]])

map('n', '<leader>', [[:silent <c-u> :silent WhichKey '<Space>'<CR>]], { silent = true })

require('map.which-key')
