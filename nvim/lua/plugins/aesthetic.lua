return {
  {
    -- Like a colorscheme, but without colors...
    "mcchrish/zenbones.nvim",
    lazy = false,
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.cmd("colorscheme zenwritten")
    end,
  },
}
