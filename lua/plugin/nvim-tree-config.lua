-----------------
--  nvim-tree  --
-----------------

require('nvim-tree').setup({
  nvim_tree_quit_on_open = true,
  auto_close = false,
  ignore_list = { '.git', 'node_modules', '.cache' },
})
