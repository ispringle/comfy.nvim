local M = {}

function M.setup()
  require('cinnamon').setup({
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = false,
    always_scroll = false,
    centered = true,
    disabled = false,
    default_delay = 7,
    hide_cursor = true,
    horizontal_scroll = true,
    max_length = -1,
    scroll_limit = 150,
  })
end

return M
