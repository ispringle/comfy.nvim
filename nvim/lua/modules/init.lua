local aesthetic = require('modules/aesthetic')
local buffer = require('modules/buffer')
local completion = require('modules/completion')
local file = require('modules/file')
local git = require('modules/git')
local lsp = require('modules/lsp')
local terminal = require('modules/terminal')

completion.setup()
git.setup()
lsp.setup()
buffer.setup()
file.setup()
terminal.setup()

-- Load this last, so colorscheme can be the final thing to load
aesthetic.setup()
