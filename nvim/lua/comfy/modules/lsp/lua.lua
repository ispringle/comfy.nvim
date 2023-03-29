local M = {}

function M.setup(lsp)
  require("neodev").setup({})

  lsp.configure("sumneko_lua", {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim" },
        },
        format = {
          enable = false,
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  })
end

return M
