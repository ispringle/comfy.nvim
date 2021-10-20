local M = {}

local plugins = require('modules/file/plugins')
local keymap = require('modules/file/keymap')

function M.setup()
  plugins.setup()
  keymap.setup()
end

return M
