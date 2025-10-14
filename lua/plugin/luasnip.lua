return {
  src = 'https://github.com/L3MON4D3/LuaSnip',
  data = {
    dep_of = { 'blink.cmp' },
    after = function()
      local ls = require('luasnip')
      local s = ls.snippet
      local sn = ls.snippet_node
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local c = ls.choice_node
      local d = ls.dynamic_node
      local r = ls.restore_node
      local l = require('luasnip.extras').lambda
      local rep = require('luasnip.extras').rep
      local p = require('luasnip.extras').partial
      local m = require('luasnip.extras').match
      local n = require('luasnip.extras').nonempty
      local dl = require('luasnip.extras').dynamic_lambda
      local fmt = require('luasnip.extras.fmt').fmt
      local fmta = require('luasnip.extras.fmt').fmta
      local types = require('luasnip.util.types')
      local conds = require('luasnip.extras.expand_conditions')

      ls.setup({
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { 'choiceNode', 'Comment' } },
            },
          },
        },
      })

      vim.keymap.set({ 'i', 's' }, '<c-l>', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<c-h>', function()
        ls.jump(-1)
      end, { silent = true })
      vim.keymap.set('i', '<c-e>', '<Plug>luasnip-next-choice')
      vim.keymap.set('s', '<c-e>', '<Plug>luasnip-next-choice')

      local function random_string(charset, length)
        local res = ''
        for _ = 1, length do
          res = res .. charset[math.random(1, #charset)]
        end
        return res
      end

      local function pass(_, _)
        local charset = {}
        for j = 33, 126 do
          table.insert(charset, string.char(j))
        end

        return random_string(charset, 32)
      end

      local function passn(_, _)
        local charset = {}
        -- 0123456789
        for j = 48, 57 do
          table.insert(charset, string.char(j))
        end
        -- ABCDEFGHIJKLMNOPQRSTUVWXYZ
        for j = 65, 90 do
          table.insert(charset, string.char(j))
        end
        -- abcdefghijklmnopqrstuvwxyz
        for j = 97, 122 do
          table.insert(charset, string.char(j))
        end

        return random_string(charset, 32)
      end

      local function get_title()
        return string.gsub(
          string.gsub(
            string.gsub(string.gsub(vim.api.nvim_buf_get_name(0), '.md', ''), vim.loop.cwd() .. '/', ''),
            '^%l',
            string.upper
          ),
          '_',
          ' '
        )
      end

      local rec_bullet
      rec_bullet = function()
        return sn(
          nil,
          c(1, {
            t(''),
            sn(nil, { t({ '', '\t- ' }), i(1), d(2, rec_bullet, {}) }),
          })
        )
      end

      ls.add_snippets('all', {
        s('pass', {
          f(pass, {}),
          t({ '', 'user: ' }),
          i(1),
          t({ '', 'url: ' }),
          i(2),
        }),
        s('passn', {
          f(passn, {}),
          t({ '', 'user: ' }),
          i(1),
          t({ '', 'url: ' }),
          i(2),
        }),
        s('cz', {
          c(1, {
            t('feat'),
            t('fix'),
            t('docs'),
            t('style'),
            t('refactor'),
            t('perf'),
            t('test'),
            t('chore'),
            t('revert'),
            t('WIP'),
          }),
          t('('),
          i(2, 'Scope'),
          t('): '),
          i(3, 'Subject. Concise description of the changes. Imperative, lower case and no final dot'),
        }),
        s('czl', {
          c(1, {
            t('feat'),
            t('fix'),
            t('docs'),
            t('style'),
            t('refactor'),
            t('perf'),
            t('test'),
            t('chore'),
            t('revert'),
            t('WIP'),
          }),
          t('('),
          i(2, 'Scope'),
          t('): '),
          i(3, 'Subject. Concise description of the changes. Imperative, lower case and no final dot'),
          c(4, {
            sn(1, {
              t({ '', '', '' }),
              i(1, 'Body. Motivation for the change and contrast this with previous behaviour'),
            }),
            t({ '' }),
          }),
          c(5, {
            sn(1, {
              t({ '', '', '' }),
              i(1, 'Footer. Information about Breaking Changes and reference issues that this commit closes'),
            }),
            t({ '' }),
          }),
        }),
      })
      ls.add_snippets('markdown', {
        s('obs', {
          t({ '---', 'title: ' }),
          f(get_title, {}),
          t({ '', 'tags: [' }),
          i(1),
          t({ ']', '---', '', '# ' }),
          f(get_title, {}),
          t({ '', '', '' }),
          i(2),
        }),
      })
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}
