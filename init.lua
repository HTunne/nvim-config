-- TODO: dap
-- TODO: obsidian
-- TODO: gitconflict
-- TODO: nvim-treesitter-context
require('settings')
require('keymap')
require('lsp')
require('obsidian')

vim.pack.add({ 'https://github.com/BirdeeHub/lze' }, { confirm = true })

local plugins = {}

for _, file in ipairs(vim.fn.readdir(
  vim.fn.stdpath('config') .. '/lua/plugin',
  [[v:val =~ '\.lua$']]
)) do
  table.insert(plugins, require('plugin.' .. file:gsub('%.lua$', '')))
end

vim.pack.add(plugins, {
  load = function(p)
    local spec = p.spec.data or {}
    spec.name = p.spec.name
    require('lze').load(spec)
  end,
  confirm = true,
})
