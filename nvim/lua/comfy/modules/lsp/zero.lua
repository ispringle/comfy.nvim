local M = {}

function M.setup(ensure_installed)
  local lsp = require("lsp-zero")
  lsp.preset("recommended")
  lsp.ensure_installed(ensure_installed or {})

  require("comfy.modules.lsp.lua").setup(lsp)

  lsp.skip_server_setup({ "tsserver" })

  lsp.nvim_workspace()

  require("comfy.modules.lsp.cmp").config(lsp)

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navbuddy").attach(client, bufnr)
    end
  end)

  lsp.setup()

  require("comfy.modules.lsp.cmp").cmdline()
  require("comfy.modules.lsp.typescript").setup(lsp)
end

return M
