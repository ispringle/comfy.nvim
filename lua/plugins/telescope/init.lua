local M = {}

function M.setup()
  require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      termfinder = {
        mappings = {
          rename_term = '<C-n>',
          delete_term = '<C-x>',
          vertical_term = '<C-v>',
          horizontal_term = '<C-h>',
          float_term = '<C-f>'
        }
      }
    }
  }

  require('telescope').load_extension("termfinder")
end

return M
