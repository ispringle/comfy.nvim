local module = "lsp"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v1.x",
      dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nanotee/nvim-lsp-basics",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim", -- Progress bar
      },
    },

    -- LSP Support

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "octaltree/cmp-look",
        -- "windwp/nvim-autopairs",
      },
    },

    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      build = "make install-jsregexp",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },

    -- Inject non-LSP info into neovim
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = {
        "jay-babu/mason-null-ls.nvim",
      },
    },

    -- Neovim setup with signature help, docs,and completion for the nvim API
    {
      "folke/neodev.nvim",
      config = true,
    },

    -- Typescript Support
    { "jose-elias-alvarez/typescript.nvim" },

    {
      "SmiteshP/nvim-navbuddy", -- LSP powered navigation
      dependencies = { "MunifTanjim/nui.nvim" },
    },

    "folke/trouble.nvim", -- LSP warnings and errors list

    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
    },

    -- DAP
    {
      "mfussenegger/nvim-dap",
      dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
      },
    },
  },
}

function M.config()
  vim.opt.signcolumn = "yes"

  require("comfy.modules.lsp.zero").setup()
  require("comfy.modules.lsp.null-ls").setup()
  require("comfy.modules.lsp.format").setup()
  require("comfy.modules.lsp.luasnip").setup()
  require("comfy.modules.lsp.lspsaga").setup()
  require("comfy.modules.lsp.trouble").setup()
  require("comfy.modules.lsp.dap").setup()

  require("fidget").setup()
end

M.keymap = require("comfy.modules.lsp.keymap").setup

return M
