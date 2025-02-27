return {
  {
    'vimwiki/vimwiki',
    enabled=false,
    lazy = false,
    cond = function()
      return string.find(vim.api.nvim_buf_get_name(0), '/notes/')
    end,
    config = function()
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
    end,
  },
  {
    'tools-life/taskwiki',
    ft = 'vimwiki',
    dependencies = {
      'vimwiki/vimwiki',
    },
  },
}
