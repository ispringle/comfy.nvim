local M = {}

function M.setup()
  require('bufferline').setup({
    options = {
      mode = "buffers",
      numbers = "ordinal",
      diagnostics = "coc",
    }
  })
end

return M
