local M = {}

function M.setup(wk)
  wk.register({
    ["<leader>g"] = {
      name = "+Git",
      o = { "<cmd>Neogit<cr>", "Toggle Neogit" },
    }
  })
end

return M
