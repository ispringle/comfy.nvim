local M = {}

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'
local b_actions = require'lir.bookmark.actions'

function M.setup()
  require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
      ['l']     = actions.edit,
      ['o']     = actions.edit,
      ['<cr>']     = actions.edit,
      ['S'] = actions.split,
      ['V'] = actions.vsplit,
      ['T'] = actions.tabedit,

      ['B']     = require'lir.bookmark.actions'.list,
      ['ba']     = require'lir.bookmark.actions'.add,

      ['h']     = actions.up,
      ['q']     = actions.quit,

      ['K']     = actions.mkdir,
      ['M']     = require'lir.mmv.actions'.mmv,
      ['N']     = actions.newfile,
      ['R']     = actions.rename,
      ['@']     = actions.cd,
      ['y']     = actions.yank_path,
      ['.']     = actions.toggle_show_hidden,
      ['D']     = actions.delete,

      ['J'] = function()
        mark_actions.toggle_mark()
        vim.cmd('normal! j')
      end,
      ['C'] = clipboard_actions.copy,
      ['X'] = clipboard_actions.cut,
      ['P'] = clipboard_actions.paste,
    },
    float = {
      winblend = 0,
      curdir_window = {
        enable = true,
        highlight_dirname = true,
      },
      win_opts = function()
        local width = math.floor(vim.o.columns * 0.5)
        local height = math.floor(vim.o.lines * 0.5)
        return {
          border = require("lir.float.helper").make_border_opts({
            "+", "─", "+", "│", "+", "─", "+", "│",
          }, "Normal"),
          width = width,
          height = height,
        }
      end,
    },
    hide_cursor = true,
    on_init = function()
      -- use visual mode
      vim.api.nvim_buf_set_keymap(
        0,
        "x",
        "J",
        ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
        { noremap = true, silent = true }
      )

      -- echo cwd
      vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
    end,
  }

  vim.cmd [[augroup lir-settings]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
  vim.cmd [[augroup END]]

  require'lir.git_status'.setup({
    show_ignored = false
  })

  require'lir.bookmark'.setup {
    bookmark_path = '~/.local/share/nvim/lir_bookmark',
    mappings = {
      ['l']     = b_actions.edit,
      ['<C-s>'] = b_actions.split,
      ['<C-v>'] = b_actions.vsplit,
      ['<C-t>'] = b_actions.tabedit,
      ['<C-e>'] = b_actions.open_lir,
      ['B']     = b_actions.open_lir,
      ['q']     = b_actions.open_lir,
    }
  }
end

M.setup()

local m = require('mapx')
m.nmap('-', '<cmd>lua require("lir.float").toggle()<cr>')
