local M = {}

local plugins = require('modules/completion/plugins')
local cmd = vim.cmd

function M.setup()
  plugins.setup()
  cmd('autocmd VimEnter * lua require("coq").Now "--shut-up"')
  cmd('autocmd InsertEnter * ++once lua require("coq").Now "--shut-up"')
end

return M
