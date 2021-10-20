local wk = require('which-key')

wk.register({
  ["<leader>t"] = {
    name = "+toggle",
    -- f = { "", "Tree" },
    -- m = { "", "Minimap" },
    e = { "<cmd>lua require('expand_expr').expand()<cr>", "Run Expand Expr" },
    g = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", "Toggle gitblame on line" },
    j = { "<cmd>JqxQuery<cr>", "Run jq/yq query" },
    J = { "<cmd>JqxList<cr>", "Prettify JSON/YAML and open keys in quickfix" },
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
    T = { "<cmd>TroubleToggle<cr>", "Trouble" },
  }
})
