return {
  src = 'https://github.com/nvim-mini/mini.nvim',
  data = {
    after = function()
      require('mini.icons').setup()
      require('mini.surround').setup()
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup({
        custom_textobjects = {
          F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
          C = spec_treesitter({ a = '@class.outer', i = '@class.inner' }),
          o = spec_treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          }),
        },
      })
      require('mini.operators').setup()
      -- require("mini.completion").setup()
      require('mini.bracketed').setup({
        diagnostic = { options = { float = false } },
        comment = { suffix = '' },
        treesitter = { suffix = '' },
      })
      -- require('mini.snippets').setup({
        -- snippets = {
          -- require('mini.snippets').gen_loader.from_lang(),
        -- },
      -- })
    end,
  },
}
