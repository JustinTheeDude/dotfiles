--[[ PACKAGE CHECK (fails silently) ]]--
local installed, _ = pcall(require, "lspconfig")
if not installed then return end

local installed, Keybind = pcall(require, "utils.keybind")
if not installed then return end

local installed, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installed then return end

local installed, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not installed then return end

--[[ DEFINE LSPCONFIG ON-ATTACH HOOK ]]--
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  end

  if client.resolved_capabilities.document_range_formatting then
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.range_formatting()' ]]
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold * checktime
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

--[[ DEFINE LANGUAGE CAPABILITIES ]]--
local function default_opts()
  -- enable snippet support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  -- optimize
  local flags = {
    debounce_text_changes = 150,
  }

  return {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags
  }
end

-- [[ DEFINE LANGUAGE SERVERS ]] --
local language_servers = {
  -- 'ansiblels',
  -- 'bashls',
  -- 'clangd',
  -- 'cmake',
  -- 'cssls',
  -- 'denols',
  -- 'dockerls',
  -- 'dotls',
  -- 'efm',
  -- 'elmls',
  -- 'emmet_ls',
  -- 'fortls',
  -- 'gopls',
  -- 'graphql',
  'html',
  -- 'jsonls',
  -- 'kotlin_language_server',
  -- 'lemminx',
  -- 'mint',
  -- 'powershell_es',
  'pyright',
  -- 'rust_analyzer',
  'sumneko_lua',
  -- 'terraformls',
  'tsserver',
  -- 'vimls',
  -- 'yamlls',
}

--- [[ INSTALL LANGUAGE SERVERS ]] --
local installed_servers = require 'nvim-lsp-installer.servers'
for _, server_name in pairs(language_servers) do
  local valid, server = installed_servers.get_server(server_name)
  if valid then
    if not server:is_installed() then
      print("Installing " .. server_name)
      server:install()
    end
  else
    print("Unknown LSP : " .. server_name)
  end
end

-- [[ START LANGUAGE SERVERS ]] --
lsp_installer.on_server_ready(function(server)
  print("Starting " .. server.name)
  local opts = default_opts()
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
