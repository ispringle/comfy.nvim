-- We turn off the following because it's not needed at all, or enabling it
-- later on speeds up start-up times
-- Never needed
vim.g.loaded_gzip = false
vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

-- Deferred loading
-- vim.opt.syntax = "off"
-- vim.opt.filetype = "off"
-- vim.opt.filetype = "plugin indent off"
-- vim.opt.shadafile = "NONE"

-- So much random stuff depends on the colorscheme being loaded before _or_
-- after, but not either. So I'll just load it twice.
require('modules/aesthetic/plugins/colorscheme').setup()

require('settings')
require('plugins')
require('mappings')
require('modules')
