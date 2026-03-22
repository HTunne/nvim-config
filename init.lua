-- TODO: dap
-- TODO: obsidian
-- TODO: gitconflict
-- TODO: nvim-treesitter-context
require('settings')
require('keymap')
require('lsp')
require('obsidian')


local plugins = {}

local config_directory = vim.fs.dirname(debug.getinfo(1, "S").source:sub(2))
for _, file in ipairs(vim.fn.readdir(config_directory .. '/lua/plugin', [[v:val =~ '\.lua$']])) do
  table.insert(plugins, require('plugin.' .. file:gsub('%.lua$', '')))
end

local specs = {}
if vim.g.skip_pack then
  for _, p in pairs(plugins) do
	  local spec = p.data or {}
    spec.name = vim.fs.basename(p.src)
	  table.insert(specs, spec)
   end
else
vim.pack.add({ 'https://github.com/BirdeeHub/lze' }, { confirm = true })
vim.pack.add(plugins, {
  load = function(p)
    local spec = p.spec.data or {}
    spec.name = p.spec.name
    table.insert(specs, spec)
  end,
  confirm = true,
})
end

require('lze').load(specs)
