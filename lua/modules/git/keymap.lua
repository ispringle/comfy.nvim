local M = {}
local wk = require('which-key')

function M.setup()
  -- Normal Mode
  wk.register({
    ["<leader>G"] = {
      name = "+Git",
      b = { '<cmd>lua require("gitsigns").toggle_current_line_blame()<cr>', "Blame Line" },
      G = { "<cmd>Neogit kind=split<cr>", "Open Neogit" },
      H = { 
        name = "+Hunk",
        p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview" },
        R = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset" },
        s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage" },
        u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo Stage" },
      },
      o = { '<cmd>lua require"gitlinker".get_repo_url()<cr>', "Yank repo url" },
      O = { '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', "Open repo url in browser" },
      R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset Buffer" },
      S = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', "Stage Buffer" },
      U = { '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', "Reset Buffer" },
      y = { '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', "Yank link to file" },
      Y = { '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', "Open file in browser" },
    -- ['n <leader>hU'] = '',
    }
  })


  -- Visual Mode
  wk.register({
    ["<leader>G"] = {
      name = "+Git",
      r = { '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Reset Selection" },
      s = { '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Stage Selection" },
      y = { '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', "Yank link to file" },
      Y = { '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', "Open file in browser" },
    }
  }, { mode = 'v' })
end

return M
