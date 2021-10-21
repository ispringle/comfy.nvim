local file = require('modules/file')
local aesthetic = require('modules/aesthetic')
local completion = require('modules/completion')
local git = require('modules/git')
local lsp = require('modules/lsp')
local terminal = require('modules/terminal')

completion.setup()
git.setup()
lsp.setup()
file.setup()
terminal.setup()

-- Load this last, so colorscheme can be the final thing to load
aesthetic.setup()
