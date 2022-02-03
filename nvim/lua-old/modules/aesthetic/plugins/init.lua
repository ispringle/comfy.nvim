local M = {}

function M.setup()
  require('modules/aesthetic/plugins/statusline').setup()
  require('modules/aesthetic/plugins/indent-blankline').setup()
  require('modules/aesthetic/plugins/tabline').setup()
  require('modules/aesthetic/plugins/colorscheme').setup()
end

return M
