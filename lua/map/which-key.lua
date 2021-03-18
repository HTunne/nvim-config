-----------------
--  which key  --
-----------------

vim.g.which_key_map = {
  o = 'newline below',
  s = 'set spell',
  e = 'open nvim tree',
  w = {
    name = '+vimwiki',
    w = 'Vimwiki Index',
    i = 'Vimwiki Diary Index',
    t = 'Vimwiki Tab Index',
    s = 'Vimwiki UI Select ',
    SPC = {
      name = '+diary',
      i = 'Vimwiki Diary Generate Links',
      t = 'Vimwiki Tab Make Diary Note',
      y = 'Vimwiki Make Yesterday Diary Note',
      m = 'Vimwiki Make Tomorrow Diary Note',
      w = 'Vimwiki Make Diary Note',
    },
  },
  l = {
    name = '+lsp',
    D = 'type definition',
    r = 'rename',
    e = 'show line diagnostics',
    q = 'set loclist',
    f = 'formatting',
    h = 'highlight',
    w = {
      name = '+workspace',
      a = 'add folder',
      r = 'remove folder',
      l = 'list folders',
    },
  },
  p = {
    name = '+telescope',
    p = 'find files in git repo',
    f = 'find files',
    g = 'grep over files',
    w = 'find current word',
  }
}
vim.cmd "call which_key#register('<Space>', 'g:which_key_map')"
