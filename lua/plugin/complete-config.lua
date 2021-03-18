----------------
--  complete  --
----------------

vim.g.SuperTabDefaultCompletionType = '<C-n>'
vim.g['completion_enable_snippet'] = 'UltiSnips'
vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
vim.g.completion_chain_complete_list = { default = { default = { { complete_items = { 'lsp', 'ts', 'snippet' }}}}}
vim.g.completion_enable_auto_popup = 0
