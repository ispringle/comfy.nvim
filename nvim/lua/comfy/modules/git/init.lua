local module = "git"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "TimUntersberger/neogit",
    "tpope/vim-fugitive",
  },
}

function M.config()
  require("gitsigns").setup()
  require("neogit").setup({ kind = "floating" })
end

return M
