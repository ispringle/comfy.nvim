local M = {}

function M.setup(wk)
  wk.register({
    ["<leader>"] = {
      ['.'] = { '<cmd>lua require("lir.float").toggle()<cr>', "Open Directory" }
    }
  }, { mode = 'n' })
end

return M
