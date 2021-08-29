----------------
--  settings  --
----------------

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 2
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('o', 'background', 'dark')
opt('o', 'completeopt', 'menuone,noselect')           -- Completion options.
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('o', 'laststatus', 2)
opt('o', 'showmode', false)

vim.g.mapleader = ' '
vim.g.tex_flavor = "latex"
vim.g.colors_name = 'one'
vim.g.bufferline = { auto_hide = true }

vim.api.nvim_exec(
[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END
]],
  true)
