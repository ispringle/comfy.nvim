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

local comfy = require('comfy')
comfy.setup()
