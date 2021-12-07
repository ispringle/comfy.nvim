local present, packer = pcall(require, "comfy.plugins.packer_init")
local pd = "comfy/plugins/"

if not present then
  return false
end

pcall(require, "impatient")

return packer.startup(function(use)
  -- The Bear Essentials
  use { "lewis6991/impatient.nvim", rocks = "mpack" } -- I can haz speed?
  use "nathom/filetype.nvim" -- Faster FT
  use { "wbthomason/packer.nvim", event = "VimEnter" } -- Le Package Manager
  use { "nvim-lua/plenary.nvim", event = "BufRead", } -- Boilerplater
  use { "nvim-lua/popup.nvim", after = {"plenary.nvim"}, } -- Pop!

  -- UI
  use {
    "mcchrish/zenbones.nvim", -- Like a colorscheme, but without colors...
    requires = {
      {"rktjmp/lush.nvim", opt = true}
    },
    config = vim.cmd[["colorscheme zenwritten"]]
  }

  use {
    "nvim-lualine/lualine.nvim", -- Statusline, but in Lua
    requires = {"kyazdani42/nvim-web-devicons"},
    after = {"zenbones.nvim"},
    config = "require'lualine-config'"
  }

  use {
    "kyazdani42/nvim-web-devicons", -- Icons, but not the Catholic sort
    opt = true,
  }

  use{
    "lukas-reineke/indent-blankline.nvim", -- Make indents visible
    after = {"zenbones.nvim"},
    config = "require'indent-blankline-config'"
  }

  -- Completion

  use {
    "hrsh7th/nvim-cmp", -- Peak laziness.
    opt = true,
    event = "InsertEnter", -- InsertCharPre
    after = {"LuaSnip"}, -- "nvim-snippy",
    requires = {
      {"hrsh7th/cmp-buffer", after = {"nvim-cmp"}, opt = true},
      {"hrsh7th/cmp-nvim-lua", after = {"nvim-cmp"}, opt = true},
      {"hrsh7th/cmp-calc", after = {"nvim-cmp"}, opt = true},
      {"hrsh7th/cmp-path", after = {"nvim-cmp"}, opt = true},
      {"hrsh7th/cmp-cmdline", after = {"nvim-cmp"}, opt = true},
      {"lukas-reineke/cmp-under-comparator", after = {"nvim-cmp"}, opt = true},
      {"hrsh7th/cmp-nvim-lsp", after = {"nvim-cmp"}, opt = true},
      {"f3fora/cmp-spell", after = {"nvim-cmp"}, opt = true},
      {"octaltree/cmp-look", after = {"nvim-cmp"}, opt = true},
      {"saadparwaiz1/cmp_luasnip", after = {"nvim-cmp", "LuaSnip"}},
    },
    config = "require'cmp-config'"
}

-- can not lazyload, it is also slow...
  use { -- need to be the first to load
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    requires = {"rafamadriz/friendly-snippets", event = "InsertEnter"}, -- , event = "InsertEnter"
    config = "require'luasnip-config'"
}

end)
