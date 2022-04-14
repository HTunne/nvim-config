------------------------------------------------------------------------
--                                paq                                 --
------------------------------------------------------------------------

-- Bootsrap paq
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
local install_required = false

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth=1',
    'https://github.com/savq/paq-nvim.git',
    install_path,
  })
  install_required = true
end

require('plugin.paq-config')

if install_required then
  vim.api.nvim_command('PaqInstall')
end

-- plugin config
require('plugin.treesitter-config')
require('plugin.nvim-tree-config')
require('plugin.nvim-cmp-config')
require('plugin.luasnip-config')
require('plugin.vimwiki-config')
require('plugin.telescope-config')
-- require('plugin.neorg-config')
require('plugin.marks-config')
require('plugin.gitsigns-config')
require('plugin.null-ls-config')
require('onedark').setup({})
require('aerial').setup({
  backends = { 'lsp', 'treesitter' },
})
require('lualine').setup({
  sections = {
    lualine_x = { 'aerial' },
  },
  options = {
    theme = 'onedark',
    section_separators = '',
    component_separators = '',
  },
})

require('twilight').setup()
require('colorizer').setup()
require('gitsigns').setup()
require('trouble').setup()
require('Comment').setup()
require('which-key').setup({ plugins = { spelling = { enabled = true } } })
require('hop').setup()
-- vim.g.UltiSnipsRemoveSelectModeMappings = 0
require('nvim-dap-virtual-text').setup()
require('nvim-biscuits').setup({
  toggle_keybind = "<leader>b",
  show_on_start = false -- defaults to false
})

vim.api.nvim_exec(
[[
augroup twilight
  autocmd!
  autocmd InsertEnter * TwilightEnable
  autocmd InsertLeave * TwilightDisable
augroup END
]], false)
