local M = {}
local wk = require('which-key')

function M.setup()
  wk.register({
    ["<leader>"] = {
      T = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
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
