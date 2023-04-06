local module = "ux"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    {
      "m4xshen/smartcolumn.nvim",
      opts = { disabled_filetypes = { "alpha", "help", "text", "lazy", "mason" } },
    }, -- "Color" line
    "nvim-lualine/lualine.nvim", -- Statusline, written in Lua
    {
      "utilyre/barbecue.nvim",
      version = "*",
      dependencies = {
        "SmiteshP/nvim-navic",
      },
      opts = {},
    },

    -- Buffer Stuff
    "akinsho/bufferline.nvim",
    "famiu/bufdelete.nvim",
    "ojroques/nvim-bufdel",

    -- UI
    {
      "folke/noice.nvim",
      cond = true,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    },
    "rcarriga/nvim-notify",

    -- Window
    "beauwilliams/focus.nvim", -- Window splits and movement

    "stevearc/dressing.nvim", -- better default `vim.ui.select/input`

    -- QoL
    "numToStr/Comment.nvim", -- Comment stuff out
    "folke/todo-comments.nvim", -- Highlight & Search for TODO keywords
    "nacro90/numb.nvim", -- peek at lines with :123
    {
      "kylechui/nvim-surround", -- Surround motions
      event = "VeryLazy",
    },
    "jghauser/mkdir.nvim", -- mkdir on save if dir doesn"t exist
    "ethanholz/nvim-lastplace", -- Open files at last location
    "sbulav/nredir.nvim", -- Redirect cmds outputs to buffers
    {
      "ggandor/lightspeed.nvim", -- vim-sneak w/ a jetpack
      dependencies = {
        "tpope/vim-repeat",
      },
    },
    "norcalli/nvim-colorizer.lua", -- Highlight colorcodes
    "declancm/cinnamon.nvim", -- smooth scrolling everywhere

    "goolord/alpha-nvim", -- Dash
    "eandrju/cellular-automaton.nvim", -- Silly animations
  },
}

function M.config()
  require("Comment").setup()
  require("todo-comments").setup()
  require("numb").setup()
  require("nvim-surround").setup()
  require("nvim-lastplace").setup()
  require("colorizer").setup()

  require("notify").setup({ render = "compact" })
  vim.notify = require("notify")

  -- require("comfy.modules.ux.noice").setup()
  require("comfy.modules.ux.bufferline").setup()
  require("comfy.modules.ux.cinnamon").setup()
  require("comfy.modules.ux.dashboard").setup()
  require("comfy.modules.ux.lualine").setup()
  require("comfy.modules.ux.focus").setup()
  require("comfy.modules.ux.screensaver").setup()
end

return M
