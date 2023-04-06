local module = "terminal"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    { "willothy/flatten.nvim", lazy = false, config = true },
    { "akinsho/toggleterm.nvim", version = "*" },
  },
}

function M.config()
  require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    autochdir = false,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float", --'vertical' | 'horizontal' | 'tab' | 'float'
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    float_opts = {
      border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      winblend = 0,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    -- vim.keymap.set("t", "<C-h>", [[<Cmd>FocusSplitLeftCR>]], opts)
    -- vim.keymap.set("t", "<C-j>", [[<Cmd>FocusSplitDown<CR>]], opts)
    -- vim.keymap.set("t", "<C-k>", [[<Cmd>FocusSplitUp<CR>]], opts)
    -- vim.keymap.set("t", "<C-l>", [[<Cmd>FocusSplitRight<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = { border = "double" },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "n",
        "q",
        "<cmd>close<CR>",
        { noremap = true, silent = true }
      )

      vim.keymap.del("t", "<esc>", { buffer = 0 })
    end,
    on_close = function()
      vim.cmd("startinsert!")
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
    end,
  })
  lazygit.display_name = "Lazygit"

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end

  vim.api.nvim_create_user_command("Lazygit", _LAZYGIT_TOGGLE, {})

  -- Scratch Terminal
  local scratch_terminal = Terminal:new({ direction = "float" })
  scratch_terminal.display_name = "Scratch Terminal"
  function TOGGLE_SCRATCH_TERM()
    scratch_terminal:toggle()
  end

  vim.api.nvim_create_user_command("ToggleScratchTerm", TOGGLE_SCRATCH_TERM, {})

  -- Split Terminal Right
  function SPLIT_TERMINAL_RIGHT()
    Terminal:new({ direction = "horizontal" }):open()
  end

  vim.api.nvim_create_user_command("SplitTerminalRight", SPLIT_TERMINAL_RIGHT, {})
  vim.keymap.set({ "t" }, "<c-s>", "<cmd>SplitTerminalRight<cr>")

  -- Split Terminal Down
  function SPLIT_TERMINAL_DOWN()
    Terminal:new({ direction = "vertical" }):open()
  end

  vim.api.nvim_create_user_command("SplitTerminalDown", SPLIT_TERMINAL_DOWN, {})
  vim.keymap.set({ "t" }, "<c-v>", "<cmd>SplitTerminalDown<cr>")
end

return M
