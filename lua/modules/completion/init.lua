local M = {}

-- local keymap = require('modules/completion/keymap')
local plugins = require('modules/completion/plugins')

function M.setup()
  plugins.setup()
  -- keymap.setup()
end

return M
