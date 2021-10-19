local wk = require('which-key')

wk.register({
  ["<leader>w"] = {
    name = "+window",
    h = { "<cmd>FocusSplitLeft<cr>", "Move to or create left window", silent=true },
    j = { "<cmd>FocusSplitDown<cr>", "Move to or create down window", silent=true },
    k = { "<cmd>FocusSplitUp<cr>", "Move to or create up window", silent=true },
    l = { "<cmd>FocusSplitRight<cr>", "Move to or create right window", silent=true },
  }
})
