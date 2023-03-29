local M = {}

function M.setup()
  local act = require("null-ls.builtins").code_actions
  local cmp = require("null-ls.builtins").completion
  local dag = require("null-ls.builtins").diagnostics
  local fmt = require("null-ls.builtins").formatting
  -- local hvr = require("null-ls.builtins").hovers

  require("null-ls").setup({
    -- debug = true,
    -- log_level = "trace",
    default_timeout = 20000,
    sources = {
      -- Actions
      act.eslint,
      act.cspell,
      act.gitsigns,

      -- Completions
      cmp.luasnip,

      -- Diagnostics
      dag.cspell.with({ filetypes = { "markdown" } }),

      -- Formatters
      fmt.stylua,
      fmt.prettier,

      -- Hovers
    },
    on_attach = function(client, bufnr)
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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

  require("mason-null-ls").setup({
    ensure_installed = {},
    automatic_setup = true,
    automatic_installation = true,
  })
end

return M
