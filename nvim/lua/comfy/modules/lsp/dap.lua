local M = {}

function M.setup()
  require("mason-nvim-dap").setup({
    ensure_installed = {},
    automatic_installation = true,
    automatic_setup = true,
  })
  require("mason-nvim-dap").setup_handlers({})
end

return M
