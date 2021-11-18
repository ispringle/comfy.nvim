local M = {}

local gps = require('nvim-gps')

function M.setup()
  gps.setup()
  require('lualine').setup({
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {
        { 'filename', path = 1, file_status = true },
        { 'diff' },
        { gps.get_location, condition = gps.is_available, separator = nil }
      },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress' },
      lualine_z = {'location'},
    },
    extensions = {},
    options = {
      icons_enabled = 1,
      padding = 1,
      theme = 'catppuccin',
    },
  })
end

return M
