local module = "terminal"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    { "willothy/flatten.nvim", lazy = false, config = true },
    "nyngwang/NeoTerm.lua",
  },
}

function M.config()
  require("neo-term").setup({
    exclude_buftypes = { "terminal" },
  })
  vim.keymap.set("t", "<M-Tab>", function()
    vim.cmd("NeoTermEnterNormal")
  end)
end

return M
