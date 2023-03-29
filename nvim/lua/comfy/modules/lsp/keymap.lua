local M = {}

ToggleInlineVirtualLines = function()
  local status = vim.diagnostic.config
  print(status)
  if status.virtual_lines then
    vim.diagnostic.config({ virtual_lines = false })
  else
    vim.diagnostic.config({ virtual_lines = true })
  end
end

function M.setup(wk)
  -- Normal Bindings
  wk.register({
    ["<leader>L"] = {
      name = "+LSP",
      D = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      g = {
        name = "+GoTo",
        w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols" },
        D = { "<cmd>lua vim.lsp.buf.declaration({ border = 'rounded', max_width = 80 })<cr>", "Declaration" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        I = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" },
        O = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" },
      },
      K = { "<cmd>lua vim.lsp.buf.hover({ popup_opts = { border = single, max_width = 80 }})<cr>", "Hover" },
      l = {
        name = "+VirtualLine",
        e = { "<cmd>lua vim.diagnostic.config({virtual_lines = true})<cr>", "Enable inline virtual lines" },
        d = { "<cmd>lua vim.diagnostic.config({virtual_lines = false})<cr>", "Disable inline virtual lines" },
      },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      w = {
        name = "+Workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
        s = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "Show workspace folders" },
      },
      -- {key = "]d<cr>", func = "<cmd>lua vim.lsp.diagnostic.goto_next({ border = 'rounded', max_width = 80})<cr>"},
      -- {key = "[d<cr>", func = "<cmd>lua vim.lsp.diagnostic.goto_prev({ border = 'rounded', max_width = 80})<cr>"},
    }
  }, { mode = 'n' })

  -- Visual Bindings
  wk.register({
    ["<leader>L"] = {
      name = "+LSP",
      c = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Code Action on Range", mode = "v" },
      f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Range Format", mode = "v" },
    }
  }, { mode = 'v' })
end

return M
