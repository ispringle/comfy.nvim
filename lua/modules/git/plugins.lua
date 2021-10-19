local M = {}

function M.setup()
  require('neogit').setup({
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    auto_refresh = true,
    disable_builtin_notifications = false,
    commit_popup = {
        kind = "split",
    },
    integrations = { diffview = true },
  })
  -- TODO configure require('diffview') for use outside of neogit
  require('gitsigns').setup({
    keymaps = {
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  })
  require('gitlinker').setup({ mappings = nil })
end

return M
