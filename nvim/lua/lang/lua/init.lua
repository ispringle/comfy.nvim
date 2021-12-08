local M = {}

-- function M.nvim-luadev()
--   require'nvim-luadev'
-- end

function M.luadev()
  local luadev = require'lua-dev'.setup()
  local lspconfig = require'lspconfig'
  lspconfig.sumneko_lua.setup(luadev)
end

return M
