local M = {}

function M.setup()
  require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/notes"
          }
        }
      },
      ["core.keybinds"] = { -- Configure core.keybinds
        config = {
          default_keybinds = true, -- Generate the default keybinds
          neorg_leader = "<Leader>o" -- This is the default if unspecified
        }
      },
      -- ["core.gtd.base"] = { -- Get Stuff Done.
      --   config = {}
      -- },
    },
  }
end

M.setup()
