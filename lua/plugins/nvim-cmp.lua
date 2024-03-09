local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-calc',
    'paopaol/cmp-doxygen',
    'onsails/lspkind-nvim',
    'doxnit/cmp-luasnip-choice',
    'ray-x/cmp-treesitter',
    'saadparwaiz1/cmp_luasnip',
    'f3fora/cmp-spell',
    'L3MON4D3/LuaSnip',
    'kdheepak/cmp-latex-symbols',
    'jmbuhr/cmp-pandoc-references',
  },
}

function M.config()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local lspkind = require('lspkind')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lua' },
      { name = 'otter' },
      { name = 'pandoc_references' },
      { name = 'latex_symbols' },
      { name = 'doxygen' },
      { name = 'luasnip' },
      { name = 'luasnip_choice' },
      { name = 'neorg' },
      { name = 'spell' },
      { name = 'calc' },
      { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
      { name = 'buffer', keyword_length = 5, max_item_count = 3 },
      { name = 'path' },
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          vim_item.menu = ({
            buffer = '﬘',
            path = 'ﱮ',
            nvim_lsp = 'ﲳ',
            nvim_lua = '',
            calc = '=',
            treesitter = '',
            luasnip = '',
            spell = '暈',
            otter = '🦦',
          })[entry.source.name]

          return vim_item
        end,
      }),
    },
    experimental = {
      ghost_text = true,
    },
    window = {
      documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      },
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
  })
end

return M
