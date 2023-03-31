local module = "files"
local M = {
  dir = module,
  name = module,
  cond = false,
  dependencies = {
    "tamago324/lir.nvim",
    "tamago324/lir-git-status.nvim",
    "tamago324/lir-mmv.nvim",
    "tamago324/lir-bookmark.nvim",
  },
  key = "<leader>.",
}

function M.config()
  require("comfy.modules.files.lir").setup()
end

return M
