local module = "utils"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    {
      "nvim-telescope/telescope.nvim", -- Le Supreme Fuzzy Finder
      dependencies = {
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "benfowler/telescope-luasnip.nvim",
        "tsakirist/telescope-lazy.nvim",
        "debugloop/telescope-undo.nvim",
        "sudormrfbin/cheatsheet.nvim",
        -- "cljoly/telescope-repo.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "aaronhallaert/advanced-git-search.nvim",
      },
    },

    "AckslD/nvim-FeMaco.lua", -- Open code blocks in scratch buffer
  },
}

function M.config()
  require("comfy.modules.util.telescope").setup()
  require("femaco").setup()
end

M.keymap = require("comfy.modules.util.keymap").setup

return M
