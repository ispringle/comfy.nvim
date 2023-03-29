local module = "lsp"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v1.x",
    },

    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-emoji" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "hrsh7th/cmp-calc" },
    { "f3fora/cmp-spell" },
    { "octaltree/cmp-look" },
    --{ "windwp/nvim-autopairs" },

    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      build = "make install-jsregexp",
    },
    { "rafamadriz/friendly-snippets" },

    -- Inject non-LSP info into neovim
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jay-babu/mason-null-ls.nvim" },

    -- Neovim setup with signature help, docs,and completion for the nvim API
    {
      "folke/neodev.nvim",
      config = true,
    },

    -- Typescript Support
    { "jose-elias-alvarez/typescript.nvim" },

    "j-hui/fidget.nvim", -- Progress bar

    {
      "SmiteshP/nvim-navbuddy", -- LSP powered navigation
      dependencies = { "MunifTanjim/nui.nvim" },
    },

    "folke/trouble.nvim",
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
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

  require("fidget").setup()
end

M.keymap = require("comfy.modules.lsp.keymap").setup

return M
