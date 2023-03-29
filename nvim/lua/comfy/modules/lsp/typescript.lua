local M = {}

function M.setup(lsp)
  local ts_config = require("typescript")
  ts_config.setup({
    server = {
      on_attach = function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navbuddy").attach(client, bufnr)
        end
      end,
      init_options = {
        plugins = {
          {
            name = "ts-lit-plugin",
            location = "/Users/IPringle/.asdf/installs/nodejs/18.11.0/lib/node_modules/ts-lit-plugin/",
          },
          {
            name = "typescript-lit-html-plugin",
            location = "/Users/IPringle/.asdf/installs/nodejs/18.11.0/lib/node_modules/typescript-lit-html-plugin/",
          },
        },
      },
    },
  })
end

return M
