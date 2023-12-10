local module = "aethetics"
local M = {
  dir = module,
  name = module,
  cond = true,
  priority = 500,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Icons, but not the Catholic sort
    {
      -- Like a colorscheme, but without colors...
      "mcchrish/zenbones.nvim",
      lazy = false,
      dependencies = "rktjmp/lush.nvim",
    },
    {
      "lukas-reineke/indent-blankline.nvim", -- Make indents visible
      main = "ibl",
    },
    "cormacrelf/dark-notify",
  },
}

function M.config()
  local vim = vim
  vim.cmd("colorscheme zenwritten")
  require("dark_notify").run()
end

return M
