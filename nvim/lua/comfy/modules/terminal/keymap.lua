return {
  -- Normal Mode
  ["n"] = {
    ["<leader>t"] = {
      name = "+toggle",
      t = { "<cmd>lua vim.cmd('NeoTermToggle')<cr>", "Toggle terminal" },
    },
  },
  -- Visual Mode
  -- ["v"] = {},
}
