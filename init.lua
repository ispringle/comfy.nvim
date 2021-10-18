-- We turn off the following because it's not needed at all, or enabling it
-- later on speeds up start-up times
-- Never needed
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

-- Deferred loading
  -- set.syntax = "off"
  -- set.filetype = "off"
  -- set.filetype = "plugin indent off"
  -- set.shadafile = "NONE"

vim.defer_fn(function()
  require('settings')
  require('plugins')
  require('mappings')

  -- set.shadafile = ""
  -- set.syntax = "on"
  -- set.filetype = "on"
  -- set.filetype = "plugin indent on"
end, 0)


