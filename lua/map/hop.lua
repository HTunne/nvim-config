local hop = require('hop')
local dir = require('hop.hint').HintDirection

return {
  name = '+hop',
  w = {
    function()
      hop.hint_words({ direction = dir.AFTER_CURSOR })
    end,
    'hop word forward',
  },
  b = {
    function()
      hop.hint_words({ direction = dir.BEFORE_CURSOR })
    end,
    'hop word backward',
  },
  f = {
    function()
      hop.hint_char1({ direction = dir.AFTER_CURSOR })
    end,
    'hop char forward',
  },
  F = {
    function()
      hop.hint_char1({ direction = dir.BEFORE_CURSOR })
    end,
    'hop char backward',
  },
  j = {
    function()
      hop.hint_lines_skip_whitespace({ direction = dir.AFTER_CURSOR })
    end,
    'hop char down',
  },
  k = {
    function()
      hop.hint_lines_skip_whitespace({ direction = dir.BEFORE_CURSOR })
    end,
    'hop line up',
  },
  n = {
    function()
      hop.hint_patterns()
    end,
    'hop search',
  },
  N = {
    function()
      hop.hint_patterns({ direction = dir.BEFORE_CURSOR })
    end,
    'hop search backward',
  },
}
