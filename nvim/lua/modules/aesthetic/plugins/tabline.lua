local M = {}

function M.setup()
  vim.g.bufferline = {
    animation = true, -- Enable/disable animations
    auto_hide = true, -- Enable/disable auto-hiding the tab bar when there is a single buffer
    tabpages = true, -- Enable/disable current/total tabpages indicator (top right corner)
    closable = true, -- Enable/disable close button
    clickable = true, -- Enables/disable clickable tabs, left-click: go to buffer; middle-click: delete buffer
    exclude_ft = {}, -- Excluded filetypes from buffer bar
    exclude_name = {}, -- Excluded file names from buffer bar
    icons = true, -- Enable/disable icons. If set to 'numbers', will show buffer index in the tabline.
                  -- If set to 'both', will show buffer index and icons in the tabline
    icon_custom_colors = false, -- If set, the icon color will follow its corresponding buffer
                                -- highlight group. By default, the Buffer*Icon group is linked to the
                                -- Buffer* group (see Highlighting below). Otherwise, it will take its
                                -- default value as defined by devicons.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = false,   -- If true, new buffers will be inserted at the start/end of the list.
    insert_at_start = false, -- Default is to insert after current buffer.
    maximum_padding = 1, -- Sets the maximum padding width with which to surround each tab
    maximum_length = 30, -- Sets the maximum buffer name length.
    semantic_letters = true,  -- If set, the letters for each buffer in buffer-pick mode will be
                              -- assigned based on their name. Otherwise or in case all letters are
                              -- already assigned, the behavior is to assign letters in order of
                              -- usability (see order below)
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil, -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
                        -- where X is the buffer number. But only a static string is accepted here.
  }
end
-- Overwrite tree open/close functions so we need to have barbar shift itself over to not draw on file drawer
function M.open_tree()
  require'bufferline.state'.set_offset(require('modules/file/plugins/tree').config.view.width + 5, '')
  require'nvim-tree'.find_file(true)
end

function M.close_tree()
  require'bufferline.state'.set_offset(0)
  require'nvim-tree'.close()
end

function M.toggle_tree()
  if require('nvim-tree.view').win_open() then
    require'bufferline.state'.set_offset(0)
  else
    require'bufferline.state'.set_offset(require('modules/file/plugins/tree').config.view.width + 5, '')
  end
  require'nvim-tree'.toggle()
end

return M
