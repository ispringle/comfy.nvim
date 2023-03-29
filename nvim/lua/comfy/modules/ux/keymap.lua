local M = {}

function M.setup(wk)
  -- Window Stuff
  wk.register({
    ["<leader>w"] = {
      name = "+window",
      h = { "<cmd>FocusSplitLeft<cr>", "Move to or create left window", silent=true },
      j = { "<cmd>FocusSplitDown<cr>", "Move to or create down window", silent=true },
      k = { "<cmd>FocusSplitUp<cr>", "Move to or create up window", silent=true },
      l = { "<cmd>FocusSplitRight<cr>", "Move to or create right window", silent=true },
    }
  })

  -- Buffer Stuff
  -- Normal Bindings
  wk.register({
    ["<leader>b"] = {
      name = "+Buffer",
      ['^'] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Goto 1st buffer" },
      ['1'] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Goto 1st buffer" },
      ['2'] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Goto 2nd buffer" },
      ['3'] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Goto 3rd buffer" },
      ['4'] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Goto 4th buffer" },
      ['5'] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Goto 5th buffer" },
      ['6'] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Goto 6th buffer" },
      ['7'] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Goto 7th buffer" },
      ['8'] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Goto 8th buffer" },
      ['9'] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Goto 9th buffer" },
      ['0'] = { "<cmd>BufferLineGoToBuffer 10<cr>", "Goto 10th buffer" },
      b = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
      c = { "<cmd>Bdelete<cr>", "Close buffer" },
      C = { "<cmd>BufferLinePickClose<cr>", "Pick buffer to close" },
      f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
      L = { "<cmd>BufferLineCloseLeft<cr>", "Close buffe to left" },
      m = { "<cmd>BufferLineMoveNext<cr>", "Move current buffer tab right" },
      M = { "<cmd>BufferLineMovePrev<cr>", "Move current buffer tab left" },
      n = { "<cmd>BufferLineCycleNext<cr>", "Goto next buffer" },
      N = { "<cmd>BufferLineCyclePrev<cr>", "Goto prev buffer" },
      O = { "<cmd>%bd|e#|bd#<cr>", "Close all other buffers, this WILL destroy window layouts" }, -- TODO migrate away from native bd command
      R = { "<cmd>BufferLineCloseRight<cr>", "Close buffer to right" },
      S = {
        name = "+Sort",
        d = { "<cmd>BufferLineSortByDirectory<cr>", "Sort buffers by directory number" },
        l = { "<cmd>BufferLineSortByExtension<cr>", "Sort buffers by language number" },
        n = { "<cmd>lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)", "Sort buffers by buffer number" },
        t = { "<cmd>BufferLineSortByTabs<cr>", "Sort buffers by tabs" },
      },
      W = { "<cmd>Bwipeout<cr>", "Wipeout buffer" },
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
