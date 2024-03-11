return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local ls = require('luasnip')
    -- some shorthands...
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local l = require('luasnip.extras').lambda
    local r = require('luasnip.extras').rep
    local p = require('luasnip.extras').partial
    local m = require('luasnip.extras').match
    local n = require('luasnip.extras').nonempty
    local dl = require('luasnip.extras').dynamic_lambda
    local fmt = require('luasnip.extras.fmt').fmt
    local fmta = require('luasnip.extras.fmt').fmta
    local types = require('luasnip.util.types')
    local conds = require('luasnip.extras.expand_conditions')

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
      -- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
      for j = 48, 57 do
        table.insert(charset, string.char(j))
      end
      for j = 65, 90 do
        table.insert(charset, string.char(j))
      end
      for j = 97, 122 do
        table.insert(charset, string.char(j))
      end

      return random_string(charset, 32)
    end

    local calculate_comment_string = require('Comment.ft').calculate
    local utils = require('Comment.utils')

    local get_cstring = function(ctype)
      -- use the `Comments.nvim` API to fetch the comment string for the region (eq. '--%s' or '--[[%s]]' for `lua`)
      local cstring = calculate_comment_string({ ctype = ctype, range = utils.get_region() }) or vim.bo.commentstring
      -- as we want only the strings themselves and not strings ready for using `format` we want to split the left and right side
      local left, right = utils.unwrap_cstr(cstring)
      -- create a `{left, right}` table for it
      return { left, right }
    end

    local function create_box(opts)
      local function box_width()
        return opts.box_width or vim.opt.textwidth:get()
      end

      local function padding(cs, input_text)
        local spaces = box_width() - (2 * #cs)
        spaces = spaces - #input_text
        return spaces / 2
      end

      local function pick_comment_start_and_end()
        -- because lua block comment is unlike other language's,
        --  so handle lua ctype
        local ctype = 2
        if vim.opt.ft:get() == 'lua' then
          ctype = 1
        end
        local cs = get_cstring(ctype)[1]
        local ce = get_cstring(ctype)[2]
        if ce == '' or ce == nil then
          ce = cs
        end
        print(cs)
        print(ce)
        return cs, ce
      end
      return {
        -- top line
        f(function()
          local cs, ce = pick_comment_start_and_end()
          return cs .. string.rep(string.sub(cs, #cs, #cs), box_width() - #cs - #ce) .. ce
        end),
        t({ '', '' }),
        f(function(args)
          local cs = pick_comment_start_and_end()
          return cs .. string.rep(' ', math.floor(padding(cs, args[1][1])))
        end, { 1 }),
        i(1, 'box'),
        f(function(args)
          local _, ce = pick_comment_start_and_end()
          return string.rep(' ', math.ceil(padding(ce, args[1][1]))) .. ce
        end, { 1 }),
        t({ '', '' }),
        -- bottom line
        f(function()
          local cs, ce = pick_comment_start_and_end()
          return cs .. string.rep(string.sub(ce, 1, 1), box_width() - #cs - #ce) .. ce
        end),
      }
    end

    local current_nsid = vim.api.nvim_create_namespace('LuaSnipChoiceListSelections')
    local current_win = nil

    local function window_for_choiceNode(choiceNode)
      local buf = vim.api.nvim_create_buf(false, true)
      local buf_text = {}
      local row_selection = 0
      local row_offset = 0
      local text
      for _, node in ipairs(choiceNode.choices) do
        text = node:get_docstring()
        -- find one that is currently showing
        if node == choiceNode.active_choice then
          -- current line is starter from buffer list which is length usually
          row_selection = #buf_text
          -- finding how many lines total within a choice selection
          row_offset = #text
        end
        vim.list_extend(buf_text, text)
      end

      vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
      local w, h = vim.lsp.util._make_floating_popup_size(buf_text)

      -- adding highlight so we can see which one is been selected.
      local extmark = vim.api.nvim_buf_set_extmark(
        buf,
        current_nsid,
        row_selection,
        0,
        { hl_group = 'incsearch', end_line = row_selection + row_offset }
      )

      -- shows window at a beginning of choiceNode.
      local win = vim.api.nvim_open_win(buf, false, {
        relative = 'win',
        width = w,
        height = h,
        bufpos = choiceNode.mark:pos_begin_end(),
        style = 'minimal',
        border = 'rounded',
      })

      -- return with 3 main important so we can use them again
      return { win_id = win, extmark = extmark, buf = buf }
    end

    function choice_popup(choiceNode)
      -- build stack for nested choiceNodes.
      if current_win then
        vim.api.nvim_win_close(current_win.win_id, true)
        vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
      end
      local create_win = window_for_choiceNode(choiceNode)
      current_win = {
        win_id = create_win.win_id,
        prev = current_win,
        node = choiceNode,
        extmark = create_win.extmark,
        buf = create_win.buf,
      }
    end

    function update_choice_popup(choiceNode)
      vim.api.nvim_win_close(current_win.win_id, true)
      vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
      local create_win = window_for_choiceNode(choiceNode)
      current_win.win_id = create_win.win_id
      current_win.extmark = create_win.extmark
      current_win.buf = create_win.buf
    end

    function choice_popup_close()
      vim.api.nvim_win_close(current_win.win_id, true)
      vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
      -- now we are checking if we still have previous choice we were in after exit nested choice
      current_win = current_win.prev
      if current_win then
        -- reopen window further down in the stack.
        local create_win = window_for_choiceNode(current_win.node)
        current_win.win_id = create_win.win_id
        current_win.extmark = create_win.extmark
        current_win.buf = create_win.buf
      end
    end

    vim.cmd([[
augroup choice_popup
au!
au User LuasnipChoiceNodeEnter lua choice_popup(require("luasnip").session.event_node)
au User LuasnipChoiceNodeLeave lua choice_popup_close()
au User LuasnipChangeChoice lua update_choice_popup(require("luasnip").session.event_node)
augroup END
]])

    ls.add_snippets('all', {
      s({ trig = 'box' }, create_box({ box_width = 24 })),
      s({ trig = 'bbox' }, create_box({})),
      s('datetime', {
        f(function(_, _)
          return os.date()
        end, {}),
      }),
      s('date', {
        f(function(_, _)
          return os.date('%Y-%m-%d')
        end, {}),
      }),
      s('time', {
        f(function(_, _)
          return os.date('%H:%M:%S')
        end, {}),
      }),
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
        i(3, 'Subject. Consise description on the changes. Imperative, lower case and no final dot'),
        c(4, {
          sn(1, {
            t({ '', '', '' }),
            i(1, 'Body. Motivation for the change and contrast this with previous behavior'),
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
      s('czs', {
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
        i(3, 'Subject. Consise description on the changes. Imperative, lower case and no final dot'),
      }),
    })
    require('luasnip/loaders/from_vscode').lazy_load()
    ls.filetype_extend('quarto', { 'markdown' })
  end,
}
