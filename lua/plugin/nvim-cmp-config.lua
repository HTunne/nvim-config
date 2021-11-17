------------------------------------------------------------------------
--                                cmp                                 --
------------------------------------------------------------------------

local cmp = require('cmp')

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

cmp.setup({
  sources = {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'calc' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    { name = 'spell' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format(
        "%s",
        vim_item.kind
      )
      vim_item.menu = ({
        buffer = "﬘",
        path = "ﱮ",
        nvim_lsp = "ﲳ",
        nvim_lua = "",
        calc = "=",
        treesitter = "",
        luasnip = "",
        spell = "暈",
      })[entry.source.name]

      return vim_item
    end,
  },
  experimental = {
    ghost_text = true,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
})
