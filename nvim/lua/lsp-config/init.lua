local M = {}

function M.setup()
  local ts_config = require('typescript')

  require("mason").setup()
  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers {
      function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
      end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      ["tsserver"] = function ()
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
  }
end

M.setup()
