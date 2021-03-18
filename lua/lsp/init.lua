-----------
--  lsp  --
-----------

local nvim_lsp = require 'lspconfig'
local on_attach = function(client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local def_map_opts = { noremap=true, silent=true }
  buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', def_map_opts)
  buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', def_map_opts)
  buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', def_map_opts)
  buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', def_map_opts)
  buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', def_map_opts)
  buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', def_map_opts)
  buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', def_map_opts)
  buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', def_map_opts)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        " autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "vuels", "ccls", "texlab", "tsserver" }
for _, lsp in ipairs(servers) do
 nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.pyls.setup { root_dir = nvim_lsp.util.root_pattern('.git', vim.fn.getcwd()), on_attach = on_attach }

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = { "lua-language-server", "-E" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}


