local module = "editor"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    { "chrisgrieser/nvim-spider", lazy = true },
    "stevearc/overseer.nvim",
  },
}

function M.config()
  require("overseer").setup({
    strategy = { "toggleterm", direction = "vertical", auto_scroll = true },
  })

  require("spider").setup({ skipInsignificantPunctuation = false })
  vim.keymap.set(
    { "n", "o", "x" },
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    { desc = "Spider-w" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    { desc = "Spider-e" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    { desc = "Spider-b" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "ge",
    "<cmd>lua require('spider').motion('ge')<CR>",
    { desc = "Spider-ge" }
  )
end

return M
