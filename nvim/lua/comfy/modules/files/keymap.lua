return {
  -- Normal Mode
  ["n"] = {
    ["<leader>"] = {
      ["."] = { '<cmd>lua require("lir.float").toggle()<cr>', "Open Directory" },
    },
  },
  -- Visual Mode
  ["v"] = {},
}
