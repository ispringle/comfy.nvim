local M = {}

function M.setup()
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,
        case_mode = "smart_case",
      },
      lazy = {
        show_icon = true,
      },
      undo = {},
    }
  }

  require('telescope').load_extension('fzf')
  require('telescope').load_extension('lazy')
  require('telescope').load_extension('luasnip')
  require('telescope').load_extension('undo')
end

return M
