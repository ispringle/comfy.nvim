
local M = {}

function M.setup()
  local ts_config = require('typescript')
  ts_config.setup({
    server = {
      init_options = {
        plugins = {
          {
            name = 'ts-lit-plugin',
            location = '~/.asdf/installs/nodejs/18.11.0/lib/node_modules/ts-lit-plugin/'
          },
        },
      }
    }
  })
end

return M
