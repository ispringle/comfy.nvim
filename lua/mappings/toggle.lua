local wk = require('which-key')

wk.register({
  ["<leader>t"] = {
    name = "+toggle",
    -- f = { "", "Tree" },
    -- m = { "", "Minimap" },
    T = { "<cmd>TroubleToggle<cr>", "Trouble" },
  }
})
