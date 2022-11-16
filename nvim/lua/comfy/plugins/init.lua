local present, packer = pcall(require, "comfy.plugins.packer_init")

if not present then
  return false
end

pcall(require, "impatient")

return packer.startup(function(use)
  -- ---- --
  -- Core --
  -- ---- --

  -- The Bear Essentials
  use { "lewis6991/impatient.nvim" } -- I can haz speed?
  use "nathom/filetype.nvim" -- Faster FT
  use { "wbthomason/packer.nvim", event = "VimEnter" } -- Le Package Manager
  use { "nvim-lua/plenary.nvim" } --, event = "BufRead", } -- Boilerplater
  use { "nvim-lua/popup.nvim", after = { "plenary.nvim" }, } -- Pop!
  use { "Olical/aniseed" } -- A compiler for Fennel

  -- Keymapping
  use {
    'folke/which-key.nvim',
    config = "require'whichkey-config'"
  }
  use { 'b0o/mapx.nvim' }

  -- -------------- --
  -- User Interface --
  -- -------------- --

  -- Aesthetic
  use {
    "EdenEast/nightfox.nvim",
    -- after = "lush.nvim",
    config = "require'nightfox-config'"
  }

  use { -- TODO: Figure out how to make this an optional plugin
    "rktjmp/lush.nvim",
    -- cmd = {"Lushify", "LushImport", "LushRunTutorial", "LushRnQuickstart"}
  }

  use {
    "nvim-lualine/lualine.nvim", -- Statusline, but in Lua
    requires = { "kyazdani42/nvim-web-devicons" },
    after = { "nightfox.nvim" },
    config = "require'lualine-config'"
  }

  use {
    "kyazdani42/nvim-web-devicons", -- Icons, but not the Catholic sort
  }

  use {
    "lukas-reineke/indent-blankline.nvim", -- Make indents visible
    after = { "nightfox.nvim" },
    config = "require'indent-blankline-config'"
  }

  -- Editor Features

  use {
    "ethanholz/nvim-lastplace",
    config = "require'nvim-lastplace'.setup()",
  }

  use "haringsrob/nvim_context_vt"
  use {
    "karb94/neoscroll.nvim",
    config = "require'neoscroll'.setup()"
  }
  use {
    "numToStr/Comment.nvim", -- Comment stuff out
    config = "require('Comment').setup()",
  }

  use {
    "folke/todo-comments.nvim", -- Highlight & Search for TODO keywords in src files
    config = "require('todo-comments').setup{}",
  }

  use {
    "norcalli/nvim-colorizer.lua", -- Highlight colorcodes with the color the reference
    event = "BufRead",
    config = "require('colorizer').setup()",
  }

  use {
    "jghauser/mkdir.nvim", -- mkdir on save if dir doesn"t exist
    config = "require('mkdir')",
  }

  use {
    "ur4ltz/surround.nvim", -- like tpope"s surround, but Luafied
    config = "require('surround').setup({ mapping_style = 'surround' })",
    event = "InsertEnter",
  }

  use {
    "ggandor/lightspeed.nvim", -- vim-sneak w/ a jetpack
    config = "require('lightspeed')",
  }

  use {
    "nacro90/numb.nvim", -- peek at lines with :123
    config = "require('numb').setup()",
  }

  use "tversteeg/registers.nvim"
  use {
    "chentoast/marks.nvim",
    config = "require'marks-config'",
  }
  use { "sbulav/nredir.nvim" } -- redirect command output to buffer

  -- Buffers and Windows and Tabs, Oh My!
  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = "require'bufferline-config'"
  }

  use { "famiu/bufdelete.nvim" }
  use { "ojroques/nvim-bufdel" }
  use { "beauwilliams/focus.nvim" }

  -- File system
  use {
    "tamago324/lir.nvim",
    requires = {
      { "tamago324/lir-git-status.nvim", },
      { "tamago324/lir-mmv.nvim", },
      { "tamago324/lir-bookmark.nvim", },
    },
    config = "require'lir-config'",
    after = { "mapx.nvim", "nvim-web-devicons" },
    opt = false,
  }

  -- -------- --
  -- Wizardry --
  -- -------- --

  -- Treesitter and Friends

  -- use({
  --   'nvim-treesitter/nvim-treesitter',
  --   config = function()
  --     require('nvim-treesitter.configs').setup({
  --       ensure_installed = { 'python', 'go', 'javascript' },
  --       highlight = { enable = true },
  --     })
  --   end,
  --   run = ':TSUpdate',
  -- })

  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = "require'treesitter-config'",
    requires = {
      -- TODO setup textobjects
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter", opt = true },
      -- Treesitter go-to definitions and such
      { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter", opt = true },
      -- Sets comment strings based on what treesitter says the lang at the cursor is
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter", opt = true },
      -- Keeps context of current pos at top of file
      { "romgrk/nvim-treesitter-context", after = "nvim-treesitter", opt = true },
    },
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }

  use {
    "williamboman/nvim-lsp-installer",
    config = "require'lsp-config'"
  }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").register_lsp_virtual_lines()
      vim.diagnostic.config({ virtual_lines = false })
    end,
  }

  use {
    "j-hui/fidget.nvim",
    config = "require('fidget').setup()"
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('trouble').setup {}"
  }

  use { "jubnzv/virtual-types.nvim", }
  use { "onsails/lspkind-nvim" }
  use { "lukas-reineke/lsp-format.nvim" }
  use { 'nanotee/nvim-lsp-basics' }
  use { 'simrat39/symbols-outline.nvim' }

  -- Completion
  use {
    "hrsh7th/nvim-cmp", -- Peak laziness.
    opt = true,
    event = "InsertEnter", -- InsertCharPre
    after = { "LuaSnip" }, -- "nvim-snippy",
    requires = {
      { "hrsh7th/cmp-buffer", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-nvim-lua", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-calc", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-path", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-emoji", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" }, opt = true },
      { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" }, opt = true },
      { "f3fora/cmp-spell", after = { "nvim-cmp" }, opt = true },
      { "octaltree/cmp-look", after = { "nvim-cmp" }, opt = true },
      use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        after = { "nvim-cmp" }
      },
      { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } },
      { "windwp/nvim-autopairs", event = "InsertEnter", opt = true, config = "require'autopairs-config'" },
    },
    config = "require'cmp-config'"
  }

  -- can not lazyload, it is also slow...
  use { -- need to be the first to load
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    requires = { "rafamadriz/friendly-snippets", event = "InsertEnter" }, -- , event = "InsertEnter"
    config = "require'luasnip-config'"
  }


  -- --------------------- --
  -- Telescope and Friends --
  -- --------------------- --

  -- use 'nvim-telescope/telescope.nvim'; -- Le Supreme Fuzzy Finder
  -- use 'nvim-telescope/telescope-symbols.nvim';
  -- use 'sudormrfbin/cheatsheet.nvim';
  -- use 'cljoly/telescope-repo.nvim';
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };


  -- --------- --
  -- Languages --
  -- --------- --

  -- JSON
  use { 'gennaro-tedesco/nvim-jqx',
    config = "require('nvim-jqx.config')",
  }

  -- Lua
  use {
    "folke/lua-dev.nvim", -- TODO: Figure out lazy-loading for this guy
    -- opt = true,
    -- ft = "lua",
    config = "require'lang.lua'.luadev()"
  }

  use {
    "bfredl/nvim-luadev", -- TODO: Figure out lazy-loading for this guy
    opt = true,
    ft = "lua",
    cmd = "Luadev"
    -- config = "require'lang.lua'.nvim-luadev()"
  }

  use {
    "euclidianAce/BetterLua.vim", -- Better Lua syntax
    opt = true,
    ft = "lua",
  }

  -- ------------ --
  -- Productivity --
  -- ------------ --

  -- use {
  --   "glacambre/firenvim",
  --   run = function() vim.fn['firenvim#install'](0) end,
  -- }

end)
