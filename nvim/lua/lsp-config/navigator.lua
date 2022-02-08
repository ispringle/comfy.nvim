local M = {}
local server_settings = require("lsp-config.lsp_servers")

function M.setup()
  local lsp_settings = {
    format_on_save = true,
    disable_format_cap = {},
    code_lens = true,
    servers = { "beancount", "cmake", "zeta_note", "taplo", "lemminx", "ansiblels", -- "awk_ls",
      "cssmodules_ls", "diagnosticls", "eslint", "emmet_ls", "remark_ls", },
  }

  for name, settings in pairs(server_settings) do
    lsp_settings[name] = settings
  end

  require('navigator').setup({
    -- ts_fold = true,
    treesitter_analysis = true,
    lsp_signature_help = true,
    lsp_installer = true,
    lsp = lsp_settings,
  })
end

return M
