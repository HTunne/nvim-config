---------------
--  vimwiki  --
---------------

vim.g['vimwiki_global_ext'] = 0
vim.g['vimwiki_table_mappings'] = 0
vim.g['vimwiki_dir_link'] = 'index'
vim.g.vimwiki_list = {
  {
    path = '~/notes/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/work/notes/',
    syntax = 'markdown',
    ext = '.md',
  },
}
