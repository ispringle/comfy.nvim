ToggleInlineVirtualLines = function()
  local status = vim.diagnostic.config
  print(status)
  if status.virtual_lines then
    vim.diagnostic.config({ virtual_lines = false })
  else
    vim.diagnostic.config({ virtual_lines = true })
  end
end
return {
  -- Normal Mode
  ["n"] = {
    ["<leader>F"] = { "<cmd>LspZeroFormat<cr>", "Format" },
    ["<leader>l"] = {
      name = "+LSP",
      a = { "<cmd>Lspsaga code_action<cr>", "Toggle code action menu" },
      d = {
        name = "+Diagnostics",
        b = { "<cmd>Lspsaga show_buffer_diagnostics<cr>", "Buffer Diagnostics" },
        c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Cursor Diagnostics" },
        l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics" },
        w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      },
      D = { "<cmd>Lspsaga peak_definition<cr>", "Peak Definition" },
      f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP Finder" },
      F = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      g = {
        name = "+GoTo",
        d = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition" },
        D = {
          "<cmd>lua vim.lsp.buf.declaration({ border = 'rounded', max_width = 80 })<cr>",
          "Declaration",
        },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        I = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls" },
        O = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls" },
        t = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto Type Definition" },
        w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols" },
      },
      h = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
      l = {
        name = "+VirtualLine",
        e = {
          "<cmd>lua vim.diagnostic.config({virtual_lines = true})<cr>",
          "Enable inline virtual lines",
        },
        d = {
          "<cmd>lua vim.diagnostic.config({virtual_lines = false})<cr>",
          "Disable inline virtual lines",
        },
      },
      r = { "<cmd>Lspsaga rename<cr>", "Rename word in current file" },
      R = { "<cmd>Lspsaga rename ++project<cr>", "Rename word in selecte files" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      t = { "<cmd>Lspsaga peak_type_definition<cr>", "Peak Type Definition" },
      w = {
        name = "+Workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
        s = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
          "Show workspace folders",
        },
      },
      -- {key = "]d<cr>", func = "<cmd>lua vim.lsp.diagnostic.goto_next({ border = 'rounded', max_width = 80})<cr>"},
      -- {key = "[d<cr>", func = "<cmd>lua vim.lsp.diagnostic.goto_prev({ border = 'rounded', max_width = 80})<cr>"},
    },
  },
  -- Visual Mode
  ["v"] = {
    ["<leader>L"] = {
      name = "+LSP",
      c = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Code Action on Range", mode = "v" },
      f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Range Format", mode = "v" },
    },
  },
}
