local M = {}

-- nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
-- nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>

function M.setup(wk)
  -- Normal Bindings
  wk.register({
    ["<leader>z"] = {
      name = "+Telekasten",
      d = { "<cmd>lua require('telekasten').find_daily_notes()<cr>", "Find daily note" },
      f = { "<cmd>lua require('telekasten').find_notes()<cr>", "Find note" },
      g = { "<cmd>lua require('telekasten').search_notes()<cr>", "Search in notes" },
      l = { "<cmd>lua require('telekasten').follow_link()<cr>", "Follow link" },
      z = { "<cmd>lua require('telekasten').panel()<cr>", "Open Telekasten panel" },
    }
  }, { mode = 'n' })

  -- Visual Bindings
  -- wk.register({
  --   ["<leader>z"] = {
  --     name = "+Telekasten",
  --     c = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Code Action on Range", mode = "v" },
  --     f = { "<cmd>lua vim.lsp.buf.range_formatting()<cr>", "Range Format", mode = "v" },
  --   }
  -- }, { mode = 'v' })
end

return M
