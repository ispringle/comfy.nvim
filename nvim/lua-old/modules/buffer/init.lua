local M = {}

local plugins = require('modules/buffer/plugins')
local keymap = require('modules/buffer/keymap')

function M.setup()
  plugins.setup()
  keymap.setup()
end

return M
