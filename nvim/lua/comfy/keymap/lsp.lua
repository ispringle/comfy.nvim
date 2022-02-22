local M = {}

function M.setup(wk)
  -- Normal Bindings
  wk.register({
    ["<leader>L"] = {
      name = "+LSP",
      c = { "<cmd>lua require('navigator.codeAction').code_action()<cr>", "Code Action" },
      d = { "<cmd>lua require('navigator.definition').definition()<cr>", "Definition" },
      D = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      g = {
        name = "+GoTo",
        r = { "<cmd>lua require('navigator.reference').reference()<cr>", "Reference" },
        ["0"] = { "<cmd>lua require('navigator.symbols').document_symbols()<cr>", "Document Symbols"},
        w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols"},
        D = { "<cmd>lua vim.lsp.buf.declaration({ border = 'rounded', max_width = 80 })<cr>",  "Declaration" },
        p = { "<cmd>lua require('navigator.definition').definition_preview()<cr>", "Definition Preview"},
        T = { "<cmd>lua require('navigator.treesitter').buf_ts()<cr>", "Treesitter Buffer"},
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation"},
        L = { "<cmd>lua require('navigator.diagnostics').show_line_diagnostics()<cr>", "Line Diagnostics" },
        G = { "<cmd>lua require('navigator.diagnostics').show_diagnostic()<cr>", "Diagnostics" },
        I = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" },
        O = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" },
      },
      k = { "<cmd>lua require('navigator.dochighlight').hi_symbol()<cr>", "Highlight Symbols" },
      K = { "<cmd>lua vim.lsp.buf.hover({ popup_opts = { border = single, max_width = 80 }})<cr>", "Hover" },
      l = { "<cmd>lua require('navigator.codelens').run_action()<cr>", "Codelens Run Action" },
      n = { "<cmd>lua require('navigator.treesitter').goto_next_usage()<cr>", "GoTo Next Diagnostic" },
      N = { "<cmd>lua require('navigator.treesitter').goto_previous_usage()<cr>", "GoTo Prev Diagnostic" },
      r = { "<cmd>lua require('navigator.rename').rename()<cr>", "Rename" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
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
      c = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Code Action on Range", mode="v" },
      f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Range Format", mode="v" },
    }
  }, { mode = 'v' })
end

return M
