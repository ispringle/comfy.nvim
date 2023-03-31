local module = "keymapping"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    "folke/which-key.nvim",
    "b0o/mapx.nvim",
    {
      "mrjones2014/legendary.nvim",
      dependencies = {
        "kkharji/sqlite.lua",
      },
    },
  },
}

function M.config()
  require("comfy.modules.keymapping.legendary").setup()
  require("comfy.modules.keymapping.whichkey").setup()
  require("comfy.modules.keymapping.mappings").setup()

  local wk = require("which-key")
  -- local utils = utils
  -- local key_table = {}
  -- local key_sources = { "files", "git", "lsp", "terminal", "util", "ux" }
  -- for _, module in pairs(key_sources) do
  --   module = "comfy.modules." .. module
  --   key_table = utils.merge(key_table, require(module).keymap)
  -- end

  require("comfy.modules.files").keymap(wk)
  require("comfy.modules.git").keymap(wk)
  require("comfy.modules.lsp").keymap(wk)
  require("comfy.modules.terminal").keymap(wk)
  require("comfy.modules.util").keymap(wk)
  require("comfy.modules.ux").keymap(wk)
end

return M
