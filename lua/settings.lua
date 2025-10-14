local indent = 4

vim.opt.breakindent = true
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = indent
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = true
vim.opt.spelllang = 'en_gb'
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = indent
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.virtualedit = 'block'
vim.opt.wildmode = 'list:longest' -- Command-line completion mode
-- vim.opt.winborder = 'rounded'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.tex_flavor = 'latex'

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = vim.api.nvim_create_augroup('UserHighlightYank', {}),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})
