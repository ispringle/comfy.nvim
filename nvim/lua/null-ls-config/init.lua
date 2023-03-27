M = {}

function M.setup()
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      -- Actions
      null_ls.builtins.code_actions.eslint,

      -- Completions
      -- Diagnostics
      -- Formatters
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,

      -- Hovers
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
  })

end

M.setup()


