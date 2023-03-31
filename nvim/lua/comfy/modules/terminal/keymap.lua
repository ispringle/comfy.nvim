local M = {}

function M.setup(wk)
  -- Normal Bindings
  wk.register({
    ["<leader>t"] = {
      name = "+Toggle",
      t = { "<cmd>lua vim.cmd('NeoTermToggle')<cr>", "Toggle terminal" },
  }, { mode = "n" })

  vim.keymap.set('t', '<M-Tab>', function () vim.cmd('NeoTermEnterNormal') end)
end

return M
