local M = {}

function M.setup()
	require('comfy.modules.files.lir').setup()
end

M.keymap = require('comfy.modules.files.keymap').setup

return M
