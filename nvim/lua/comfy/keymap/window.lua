local M = {}

function M.setup(wk)
  require('focus').setup({
    enable = true,
    bufnew = false,
    hybridnumber = true,
    number = false,
    relativenumber = false,
    signcolumn = true,
    winhighlight  = false,
  })

  wk.register({
    ["<leader>w"] = {
      name = "+window",
      h = { "<cmd>FocusSplitLeft<cr>", "Move to or create left window", silent=true },
      j = { "<cmd>FocusSplitDown<cr>", "Move to or create down window", silent=true },
      k = { "<cmd>FocusSplitUp<cr>", "Move to or create up window", silent=true },
      l = { "<cmd>FocusSplitRight<cr>", "Move to or create right window", silent=true },
    }
  })
end

return M
