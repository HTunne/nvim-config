local cmp = require('cmp')
local luasnip = require('luasnip')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
local s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
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
  ["<Tab>"] = { tab_complete, 'Tab complete', { 'i', 's' } },
  ["<S-Tab>"] = { s_tab_complete, 'Shift Tab complete', { 'i', 's' } },
}
