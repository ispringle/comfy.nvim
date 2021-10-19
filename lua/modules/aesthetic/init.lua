local M = {}

-- local keymap = require('modules/aesthetic/keymap')
local plugins = require('modules/aesthetic/plugins')

function M.setup()
  plugins.setup()
  -- keymap.setup()
end

return M
