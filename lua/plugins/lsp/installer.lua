local lsp_installer = require("nvim-lsp-installer")
local servers = {
  "ansiblels",
  "bashls",
  "diagnosticls",
  "docker",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "texlab",
  "pyright",
  "rust_analyzer",
  "semneko_lua",
  "sqlls",
  "stylelint_lsp",
  "tsflint",
  "tsserver",
  "lemminx",
  "yamlls",
}



for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  -- Check that the server is supported in nvim-lsp-installer
  if ok then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
