local M = {}
local wk = require('which-key')
local m = require('mapx')

m.nmap('-', '<cmd>lua require("lir.float").toggle()<cr>')

function M.setup()
  wk.register({
    ["<leader>"] = {
    }
  })

  -- Normal Bindings
  wk.register({
    ["<leader>b"] = {
      name = "+Buffer",
      ['^'] = {"<cmd>BufferGoto 1<cr>", "Goto 1st buffer"},
      ['1'] = {"<cmd>BufferGoto 1<cr>", "Goto 1st buffer"},
      ['2'] = {"<cmd>BufferGoto 2<cr>", "Goto 2nd buffer"},
      ['3'] = {"<cmd>BufferGoto 3<cr>", "Goto 3rd buffer"},
      ['4'] = {"<cmd>BufferGoto 4<cr>", "Goto 4th buffer"},
      ['5'] = {"<cmd>BufferGoto 5<cr>", "Goto 5th buffer"},
      ['6'] = {"<cmd>BufferGoto 6<cr>", "Goto 6th buffer"},
      ['7'] = {"<cmd>BufferGoto 7<cr>", "Goto 7th buffer"},
      ['8'] = {"<cmd>BufferGoto 8<cr>", "Goto 8th buffer"},
      ['9'] = {"<cmd>BufferGoto 9<cr>", "Goto 9th buffer"},
      ['0'] = {"<cmd>BufferLast<cr>", "Goto last buffer"},
      ['$'] = {"<cmd>BufferLast<cr>", "Goto last buffer"},
      b = {"<cmd>BufferPick<cr>", "Pick buffer"},
      c = {"<cmd>BufferClose<cr>", "Close current buffer"},
      C = {"<cmd>BufferCloseAllButCurrent<cr>", "Close all buffers but current"},
      L = {"<cmd>BufferCloseBuffersLeft<cr>", "Close buffers to left"},
      n = {"<cmd>BufferNext<cr>", "Next buffer"},
      N = {"<cmd>BufferPrevious<cr>", "Prev buffer"},
      m = {"<cmd>BufferMoveNext<cr>", "Swap current buffer with next buffer"},
      M = {"<cmd>BufferMovePrevious<cr>", "Swap current buffer with prev buffer"},
      p = {"<cmd>BufferPin<cr>", "Pin buffer"},
      R = {"<cmd>BufferCloseBuffersRight<cr>", "Close buffers to right"},
      S = {
        name = "+Sort",
        d = {"<cmd>BufferOrderByDirectory<cr>", "Sort buffers by directory number"},
        l = {"<cmd>BufferOrderByLanguage<cr>", "Sort buffers by language number"},
        n = {"<cmd>BufferOrderByNumber<cr>", "Sort buffers by buffer number"},
      },
      W = {"<cmd>BufferWipeout<cr>", "Close buffers to right"},
    }
  }, { mode = 'n' })

  -- Visual Bindings
  wk.register({
    ["<leader>f"] = {
      name = "+File",
      c = {},
    }
  }, { mode = 'v' })
end

return M
