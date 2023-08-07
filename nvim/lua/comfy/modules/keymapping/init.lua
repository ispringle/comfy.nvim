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
  local utils = utils
  local key_table = {}
  local key_sources = {
    -- "completion",
    -- "files",
    "git",
    -- "lsp",
    "terminal",
    "util",
    "ux",
  }
  for _, module in pairs(key_sources) do
    module = "comfy.modules." .. module .. ".keymap"
    key_table = utils.merge(key_table, require(module))
  end

  for mode, mappings in pairs(key_table) do
    wk.register(mappings, { mode = mode })
  end
end

return M
