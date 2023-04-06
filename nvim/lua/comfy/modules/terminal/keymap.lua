return {
  -- Normal Mode
  ["n"] = {
    ["<leader>t"] = {
      name = "+toggle",
      t = {
        "<cmd>ToggleScratchTerm<cr>",
        "Toggle scratch terminal",
      },
      s = {
        "<cmd>SplitTerminalRight<cr>",
        "New Hortizontal terminal",
      },
      v = {
        "<cmd>SplitTerminalDown<cr>",
        "New Hortizontal terminal",
      },
    },
    ["<leader>g"] = {
      name = "+Git",
      o = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Toggle Lazygit" },
    },
  },
  -- Visual Mode
  -- ["v"] = {},
}
