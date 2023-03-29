local M = {}

function M.setup()
  require('focus').setup({
    enable = true,
    bufnew = false,
    hybridnumber = true,
    number = false,
    relativenumber = false,
    signcolumn = true,
    winhighlight  = false,
  })
end

return M
