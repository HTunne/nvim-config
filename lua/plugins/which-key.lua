return {
  'folke/which-key.nvim',
  opts = { plugins = { spelling = { enabled = true } } },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- leader mappings
    wk.register({
      ['<space>'] = { name = '+hop' },
      b = { name = '+buffers' },
      d = {
        name = '+dap',
        o = { name = '+osv' },
        p = { name = '+python' },
        r = { name = '+repl' },
        s = { name = '+set breakpoint' },
      },
      h = { name = '+gitsigns' },
      i = { name = '+diagnostic' },
      l = { name = '+lsp' },
      p = {
        name = '+telescope',
        d = { name = '+telescope-dap' },
      },
      w = {
        name = '+vimwiki',
        w = 'Vimwiki Index',
        i = 'Vimwiki Diary Index',
        t = 'Vimwiki Tab Index',
        s = 'Vimwiki UI Select ',
        ['<space>'] = {
          name = '+diary',
          i = 'Vimwiki Diary Generate Links',
          t = 'Vimwiki Tab Make Diary Note',
          y = 'Vimwiki Make Yesterday Diary Note',
          m = 'Vimwiki Make Tomorrow Diary Note',
          w = 'Vimwiki Make Diary Note',
        },
      },
    }, { prefix = '<leader>' })
    wk.register({ '<C-w>', '+window' })
  end,
}
