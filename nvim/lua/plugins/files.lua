return {
  {
    "tamago324/lir.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "tamago324/lir-git-status.nvim",
      "tamago324/lir-mmv.nvim",
      "tamago324/lir-bookmark.nvim",
    },
    config = function()
      require("comfy.modules.files").setup()
    end,
    key = "<leader>.",
  },
}
