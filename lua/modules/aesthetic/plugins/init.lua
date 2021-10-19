local M = {}

function M.setup()
  require('modules/aesthetic/plugins/colorscheme').setup()
  require('modules/aesthetic/plugins/indent-blankline').setup()
end

return M
