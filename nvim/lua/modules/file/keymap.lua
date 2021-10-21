local M = {}
local wk = require('which-key')
local m = require('mapx')

m.nmap('-', '<cmd>lua require("lir.float").toggle()<cr>')

function M.setup()
  wk.register({
    ["<leader>"] = {
    }
  })

  -- Normal Bindings
  wk.register({
    ["<leader>f"] = {
      name = "+File",
      D = {"Delete current buffer."},
      w = {
        name = "+Foo",
        a = {},
      },
    }
  }, { mode = 'n' })

  -- Visual Bindings
  wk.register({
    ["<leader>f"] = {
      name = "+File",
      c = {},
    }
  }, { mode = 'v' })
end

return M
