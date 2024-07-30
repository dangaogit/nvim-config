local lsp_installer = require('mason')
local mason_lsp = require('mason-lspconfig')
local lsp_config = require('lspconfig')

local servers_config = {
  lua_ls = require('lsp.config.lua'),
}

lsp_installer.setup()

for name, _ in pairs(servers_config) do
  local server_config = servers_config[name]
  server_config.on_setup(lsp_config.lua_ls)
end

mason_lsp.setup({
  ensure_installed = {
    'lua_ls',
    'rust_analyzer',
    'jsonls',
    'bashls',
  },
  automatic_installation = true,
})
