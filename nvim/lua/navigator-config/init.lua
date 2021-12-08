require'navigator'.setup({
  debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
  default_mapping = true,  -- set to false if you will remap every key
  keymaps = {{key = "gD", func = "declaration()"}}, -- a list of key maps
  -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
  -- please check mapping.lua for all keymaps
  treesitter_analysis = true, -- treesitter variable context
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  icons = {
    code_action_icon = "﫠",
    diagnostic_head = "",
    diagnostic_head_severity_1 = "",
  },
  lsp_installer = true,
  lsp = {
    code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    format_on_save = true,
    -- disable_format_cap = {"sqls", "sumneko_lua", "gopls"},  -- a list of lsp disable formating
    -- disable_lsp = {'pylsd', 'sqlls'}, -- a list of lsp server disabled for your project
    -- only want to enable one lsp server
    -- to disable all default config and use your own lsp setup set
    diagnostic_scrollbar_sign = {'▃', '▆', '█'},
    diagnostic_virtual_text = true,  -- show virtual for diagnostic message
    diagnostic_update_in_insert = true, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors
    servers = {},
  }
})
