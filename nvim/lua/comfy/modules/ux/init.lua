local module = "ux"
local M = {
  dir = module,
  name = module,
  dependencies = {
    { "m4xshen/smartcolumn.nvim", opts = {}, }, -- "Color" line
    "nvim-lualine/lualine.nvim",                -- Statusline, written in Lua
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

    -- Window
    "beauwilliams/focus.nvim", -- Window splits and movement

    -- QoL
    "numToStr/Comment.nvim",    -- Comment stuff out
    "folke/todo-comments.nvim", -- Highlight & Search for TODO keywords
    "nacro90/numb.nvim",        -- peek at lines with :123
    {
      "kylechui/nvim-surround", -- Surround motions
      event = "VeryLazy",
    },
    "jghauser/mkdir.nvim",         -- mkdir on save if dir doesn"t exist
    'ethanholz/nvim-lastplace',    -- Open files at last location
    "sbulav/nredir.nvim",          -- Redirect cmds outputs to buffers
    "ggandor/lightspeed.nvim",     -- vim-sneak w/ a jetpack
    "norcalli/nvim-colorizer.lua", -- Highlight colorcodes
    'declancm/cinnamon.nvim',      -- smooth scrolling everywhere
  },
}


function M.config()
  require('Comment').setup()
  require('todo-comments').setup()
  require('numb').setup()
  require("nvim-surround").setup()
  require("nvim-lastplace").setup()
  require('colorizer').setup()

  require("comfy.modules.ux.bufferline").setup()
  require("comfy.modules.ux.cinnamon").setup()
  require("comfy.modules.ux.lualine").setup()
  require("comfy.modules.ux.focus").setup()
end

M.keymap = require('comfy.modules.ux.keymap').setup

return M
