local M = {}

local keymap = require('modules/lsp/keymap')
local plugins = require('modules/lsp/plugins')

function M.setup()
  plugins.setup()
  keymap.setup()
end

return M
