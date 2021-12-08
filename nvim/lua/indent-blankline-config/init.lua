local M = {}

function M.setup()
  -- IDK why I need this, but I do.
  vim.cmd [[packadd indent-blankline.nvim]]
  vim.opt.list = true
  -- vim.opt.listchars:append("space:⋅")
  vim.opt.listchars:append("eol:↴")
  vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

  require("indent_blankline").setup {
    buftype_exclude = {"pakcer", "terminal"},
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
    use_treesitter = true,
  }
end

M.setup()
