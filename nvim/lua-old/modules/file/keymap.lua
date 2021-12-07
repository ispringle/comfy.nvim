local M = {}
-- local wk = require('which-key')
local m = require('mapx')

m.nmap('-', '<cmd>lua require("lir.float").toggle()<cr>')

function M.setup()
--   wk.register({
--     ["<leader>"] = {
--     }
--   })
--
  -- Normal Bindings
  -- wk.register({
  --   ["<leader>F"] = {
  --     name = "+File",
  --     f = {"<cmd>Telescope live_grep<cr>", "Open finder"},
  --   }
  -- }, { mode = 'n' })

  -- Visual Bindings
--   wk.register({
--     ["<leader>F"] = {
--       name = "+File",
--       c = {},
--     }
--   }, { mode = 'v' })
end

return M
