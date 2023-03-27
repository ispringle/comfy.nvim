local M = {}

-- function M.nvim-luadev()
--   require'nvim-luadev'
-- end

function M.setup()
  require'neodev'.setup()
  local lspconfig = require'lspconfig'
  lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    }
  })
end

return M
