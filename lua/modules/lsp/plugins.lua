local M = {}

function M.setup()
  require('navigator').setup({
    default_mapping = false,
    lsp_installer = true,
  })
  require('lsp_signature').setup()
end

return M
