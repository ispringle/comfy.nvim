local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup{
          on_attach = function(client, bufnr)
            local basics = require('lsp_basics')
            basics.make_lsp_commands(client, bufnr)
            basics.make_lsp_mappings(client, bufnr)
          end
        }
    end,
    ["sumneko_lua"] = function () require("lang.lua").setup() end,
    ["tsserver"] = function () require("lang.tsserver").setup() end,
  }
end

M.setup()
