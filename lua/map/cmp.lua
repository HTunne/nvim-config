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

return {
  name = '+cmp',
  ['<C-n>'] = 'completion selection down',
  ['<C-p>'] = 'completion selection up',
  ['<Down>'] = 'completion selection down',
  ['<Up>'] = 'completion selection up',
  ['<C-d>'] = { function() cmp.mapping.scroll_docs(-4) end, 'scroll docs up' },
  ['<C-f>'] = { function() cmp.mapping.scroll_docs(4) end, 'scroll docs down' },
  ['<C-e>'] = { cmp.mapping.close, '' },
  ['<CR>'] = { function() cmp.mapping.confirm({ select = true }) end, '' },

  -- Configure for <TAB> people
  -- - <TAB> and <S-TAB>: cycle forward and backward through autocompletion items
  -- - <TAB> and <S-TAB>: cycle forward and backward through snippets tabstops and placeholders
  -- - <TAB> to expand snippet when no completion item selected (you don't need to select the snippet from completion item to expand)
  -- - <C-space> to expand the selected snippet from completion menu
  ["<C-Space>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
      end

      cmp.select_next_item()
    elseif has_any_words_before() then
      press("<Space>")
    else
      fallback()
    end
  end, {
      "i",
      "s",
    }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
      press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
      press("<ESC>:call UltiSnips#JumpForwards()<CR>")
    elseif cmp.visible() then
      cmp.select_next_item()
    elseif has_any_words_before() then
      press("<Tab>")
    else
      fallback()
    end
  end, {
      "i",
      "s",
    }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
      press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
    elseif cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, {
      "i",
      "s",
    }),
}
