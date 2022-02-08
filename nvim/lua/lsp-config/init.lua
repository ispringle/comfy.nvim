local M = {}
local server_settings = require("lsp-config.lsp_servers")

local function install_servers()
  local lsp_installer = require('nvim-lsp-installer.servers')
  for server_name, _ in pairs(server_settings) do
    local _, server = lsp_installer.get_server(server_name)
    if not server:is_installed() then
      server:install()
    end
  end
end

function M.setup()
  install_servers()
  require('lsp-config.navigator').setup()
  require('lsp_signature').setup()
  require('lspsaga').init_lsp_saga()
  require('lsp-config.trouble').setup()
end

M.setup()
