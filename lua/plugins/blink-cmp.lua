return {
  'saghen/blink.cmp',
  version = 'v0.*',
  -- !Important! Make sure you're using the latest release of LuaSnip
  -- `main` does not work at the moment
  dependencies = {
    'L3MON4D3/LuaSnip', version = 'v2.*'
  },
  event = 'InsertEnter',
  opts = {
    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    sources = {
      default = { 'lsp', 'luasnip', 'path', 'buffer', 'snippets' },
      providers = {
        lsp = {
          name = 'lsp',
          enabled = true,
          module = 'blink.cmp.sources.lsp',
          -- kind = 'LSP',
          -- fallbacks = { 'snippets', 'luasnip', 'buffer' },
          score_offset = 90, -- the higher the number, the higher the priority
        },
        luasnip = {
          name = 'luasnip',
          enabled = true,
          module = 'blink.cmp.sources.luasnip',
          min_keyword_length = 2,
          -- fallbacks = { 'snippets' },
          score_offset = 85,
          max_items = 8,
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 3,
          -- When typing a path, I would get snippets and text in the
          -- suggestions, I want those to show only if there are no path
          -- suggestions
          -- fallbacks = { 'snippets', 'luasnip', 'buffer' },
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            -- get_cwd = function(context)
            -- return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
            -- end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = 'Buffer',
          enabled = true,
          max_items = 3,
          module = 'blink.cmp.sources.buffer',
          min_keyword_length = 3,
        },
        snippets = {
          name = 'snippets',
          enabled = true,
          max_items = 3,
          module = 'blink.cmp.sources.snippets',
          min_keyword_length = 3,
          score_offset = 80, -- the higher the number, the higher the priority
        },
      },
    },
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },

      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
    },
  },
}
