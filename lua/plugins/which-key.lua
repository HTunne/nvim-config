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
      h = {
        name = '+gitsigns',
        t = { name = '+toggle' },
      },
      i = { name = '+diagnostic' },
      l = { name = '+lsp' },
      n = {
        name = '+neorg',
        j = { name = '+journal' },
        l = { name = '+list' },
        m = { name = '+mode' },
        t = { name = '+todo' },
      },
      p = {
        name = '+telescope',
        d = { name = '+telescope-dap' },
      },
      r = { name = '+dispatch' },
      t = { name = '+trouble' },
    }, { prefix = '<leader>' })
    wk.register({ '<C-w>', '+window' })
  end,
}
