local M = {}

function M.setup()
	require('comfy.settings').setup(vim)
	require('comfy.lazy').setup()
end

return M
