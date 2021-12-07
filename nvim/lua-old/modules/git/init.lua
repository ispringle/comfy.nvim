local M = {}

local plugins = require('modules/git/plugins')
local keymap = require('modules/git/keymap')

function M.setup()
  plugins.setup()
  keymap.setup()
end

return M
