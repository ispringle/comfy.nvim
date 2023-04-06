local M = {}

function M.setup()
  require("alpha").setup(require("comfy.modules.ux.dashboard.theme").config)
end

return M
