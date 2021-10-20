local m = require('mapx').setup({ global = true })

-- Hard mode
m.noremap('<down>', '<Nop>')
m.noremap('<up>', '<Nop>')
m.noremap('<left>', '<Nop>')
m.noremap('<right>', '<Nop>')
m.inoremap('<down>', '<Nop>')
m.inoremap('<up>', '<Nop>')
m.inoremap('<left>', '<Nop>')
m.inoremap('<right>', '<Nop>')
m.vnoremap('<down>', '<Nop>')
m.vnoremap('<up>', '<Nop>')
m.vnoremap('<left>', '<Nop>')
m.vnoremap('<right>', '<Nop>')

-- Disable hlsearch highlights
m.nnoremap('<leader><space>', ':nohlsearch<CR>')

-- When indenting in visual select, don't unselect after indent
-- Also, tab with <Tab>
m.vnoremap('<', '<gv', 'silent')
m.vnoremap('>', '>gv', 'silent')
m.vnoremap('<S-Tab>', '<gv', 'silent')
m.vnoremap('<Tab>', '>gv', 'silent')

require('mappings.toggle')
require('mappings.window')
