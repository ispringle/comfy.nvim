local module = "git"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "TimUntersberger/neogit",
  },
}

function M.config()
  require("gitsigns").setup()
  require("neogit").setup()
end

return M
