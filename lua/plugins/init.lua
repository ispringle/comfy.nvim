local fn = vim.fn

-- Set packer install path
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Bootstrap Packer
if fn.empty(fn.glob(packer_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_path
  })
end

-- Load packer
vim.cmd([[ packadd packer.nvim ]])
local packer = require('packer')

-- Packer Settings
packer.init({
  git = {
    clone_timeout = 300, -- 5 minutes
    subcommands = {
      instal = "clone --depth %i --progress", -- Save bandwidth
    },
  },
  profile = {
    enable = true,
  },
})

packer.startup(function(use)
  -- +---------------------+
  -- | The Bear Essentials |
  -- +---------------------+

  -- The Packer Package Manager
  use {'wbthomason/packer.nvim', opt = true}

  -- Lua QoL Stuff
  use 'nvim-lua/plenary.nvim'

  -- Syntax Crawling
  use {
    'nvim-treesitter/nvim-treesitter',
    opt = true,
    run = ":TSUpdate",
    branch = vim.fn.has("nvim-0.6.0") == 1 and "master" or "0.5-compat",
    config = require("plugins.nvim-treesitter"),
  }

  -- Language Server Protocol stuff
  use {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('plugins.lsp.config')
    end
  }

  use {
    'williamboman/nvim-lsp-installer',
    after = "nvim-lspconfig",
    config = function()
      local lspconfig = require('plugins.lsp.installer')
    end
  }

  -- Session Management
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup({})
    end,
  })

  -- Sets comment strings based on what treesitter says the lang at the cursor is
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = { "Olical/aniseed" },
    after = "nvim-treesitter",
  })

  -- Le Supreme Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- +---------------------+
  -- | A E S T H E T I C S |
  -- +---------------------+

  -- It's a... dashboard... duh
  -- use({
  --   "glepnir/dashboard-nvim",
  --   config = require("plugins.dashboard-nvim"),
  -- })

  -- Dim the text not near cursor
  use {
   "folke/twilight.nvim",
   config = function()
     require("twilight").setup {}
   end
  }

  -- +-----------------+
  -- | Editor Features |
  -- +-----------------+

  -- Comment stuff out
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  -- Highlight & Search for TODO keywords in src files
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  }

  -- +-----------------+
  -- | Editor Features |
  -- +-----------------+

  -- Magit, but in Blessed Neovim
  use {
    'TimUntersberger/neogit',
    run = ":Neogit",
    requires = 'nvim-lua/plenary.nvim'
  }

  -- +------------------+
  -- | Language Support |
  -- +------------------+

  use {
    'folke/lua-dev.nvim',
    ft = {'lua'},
    config = function()
      --local luadev = require('lua-dev').setup({})
      --local lspconfig = require('lspconfig')
      --lspconfig.sumneko_lua.setup(luadev)
    end
  }

  -- This bootstraps packer if it's not installed, needs to be the last
  -- part of this startup function
  if packer_bootstrap then
    require('packer').sync()
  end
end)
