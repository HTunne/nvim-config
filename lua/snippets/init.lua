local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
	local file = io.popen(command, "r")
	local res = {}
	for line in file:lines() do
		table.insert(res, line)
	end
	return res
end

ls.snippets = {
	-- When trying to expand a snippet, luasnip first searches the tables for
	-- each filetype specified in 'filetype' followed by 'all'.
	-- If ie. the filetype is 'lua.c'
	--     - luasnip.lua
	--     - luasnip.c
	--     - luasnip.all
	-- are searched in that order.
	all = {
    s("datetime", {
      f(function(_, _) return os.date() end, {})
    }),
    s("date", {
      f(function(_, _) return os.date("%Y-%m-%d") end, {})
    }),
    s("time", {
      f(function(_, _) return os.date("%H:%M:%S") end, {})
    }),
    s("pass", {
      f(bash, {}, "< /dev/urandom tr -dc [:graph:] | head -c 32"),
	    t({"","user: "}), i(1),
	    t({"","url: "}), i(2),
    }),
    s("passn", {
      f(bash, {}, "< /dev/urandom tr -dc [:alnum:] | head -c 32"),
	    t({"","user: "}), i(1),
	    t({"","url: "}), i(2),
    }),
  }
}
require("luasnip/loaders/from_vscode").lazy_load()
