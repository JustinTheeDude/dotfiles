local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig');

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'tsserver',
  'eslint',
	'tailwindcss',
  'volar'
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.eslint.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.volar.setup{
	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

lsp.setup()
