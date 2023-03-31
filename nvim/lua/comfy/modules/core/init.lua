local module = "core"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    -- I think this might be no longer needed
    -- "lewis6991/impatient.nvim", -- I can haz speed?
    -- I'm not sure if this is needed still
    -- "nathom/filetype.nvim", -- Faster FT
    { "folke/lazy.nvim", version = "*" },
    "nvim-lua/plenary.nvim", -- Boilerplater
    { "nvim-lua/popup.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Pop!
    "Olical/aniseed", -- A compiler for Fennel
  },
}

return M
