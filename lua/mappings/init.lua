-- local utils  = require('utils')

-- utils.map('nnoremap', '<leader><space>', ':nohlsearch<CR>')

local wk = require('which-key')

wk.register({
  ["<leader>"] = {
    T = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
  }
})

require('mappings.toggle')
require('mappings.window')
