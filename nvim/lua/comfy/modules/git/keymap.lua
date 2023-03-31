return {
  -- Normal Mode
  ["n"] = {
    ["<leader>g"] = {
      name = "+Git",
      o = { "<cmd>Neogit<cr>", "Toggle Neogit" },
    },
  },
  -- Visual Mode
  ["v"] = {},
}
