local M = {}
local server_settings = require("lsp-config.lsp_servers")

local function install_servers(lsp_installer)
  for server_name, _ in pairs(server_settings) do
    local _, server = lsp_installer.get_server(server_name)
    if not server:is_installed() then
      server:install()
    end
  end
end

function M.setup()
  require("lsp-format").setup {}

  local lsp_installer = require "nvim-lsp-installer"
  install_servers(lsp_installer)

  local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require 'virtualtypes'.on_attach(client)
    require 'lsp-format'.on_attach(client)

    local basics = require('lsp_basics')
    basics.make_lsp_commands(client, bufnr)
    basics.make_lsp_mappings(client, bufnr)

  end

  require("nvim-lsp-installer").settings {
    log = vim.log.levels.DEBUG,
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }

  lsp_installer.on_server_ready(function(server)
    server:setup {
      on_attach = on_attach,
    }
  end)

end

M.setup()
