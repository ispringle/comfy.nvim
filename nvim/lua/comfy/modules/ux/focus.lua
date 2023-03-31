local M = {}

function M.setup()
  require("focus").setup({
    bufnew = false,
    enable = true,
    hybridnumber = true,
    -- minwidth = 90,
    number = false,
    relativenumber = false,
    signcolumn = true,
    winhighlight = false,
  })
end

return M
