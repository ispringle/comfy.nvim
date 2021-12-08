local M = {}

function M.setup()
  local ls = require "luasnip"
  ls.config.set_config {history = true, updateevents = "TextChanged,TextChangedI"}
  require("luasnip.loaders.from_vscode").load {}

  vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
  vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
end

M.setup()
