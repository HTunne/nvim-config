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
  local res = ""
  for _ = 1, length
  do
    res = res .. charset[math.random(1, #charset)]
  end
  return res
end

local function pass(_, _)
  local charset = {}
  for i = 33, 126 do table.insert(charset, string.char(i)) end

  return random_string(charset, 32)
end

local function passn(_, _)
  local charset = {}
  -- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
  for i = 48,  57 do table.insert(charset, string.char(i)) end
  for i = 65,  90 do table.insert(charset, string.char(i)) end
  for i = 97, 122 do table.insert(charset, string.char(i)) end

  return random_string(charset, 32)
end

ls.add_snippets('all', {
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
})
require('luasnip/loaders/from_vscode').lazy_load()
