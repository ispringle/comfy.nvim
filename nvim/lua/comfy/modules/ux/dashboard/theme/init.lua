local if_nil = vim.F.if_nil

local footer = {
  type = "text",
  val = { "Hi" },
  opts = {
    position = "center",
  },
}
local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = "[" .. sc .. "] ",
    cursor = 1,
    width = 10,
    align_shortcut = "left",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end
local buttons = {
  type = "group",
  val = {
    button("e", "New", "<cmd>ene <CR>"),
    button(".", "Browse", "<cmd>Telescope file_browser path=%p<CR>"),
    button("f", "Find", "<cmd>Telescope find_files path=%p<CR>"),
    button("g", "Grep", "<cmd>Telescope live_grep path=%p<CR>"),
    button("r", "Recent", "<cmd>Telescope oldfiles<CR>"),
    button(
      "c",
      "Config",
      "<cmd>lua require('telescope').extensions.file_browser.file_browser({path = vim.fn.stdpath('config'),})<CR>"
    ),
    button("q", "Quit", "<cmd>q <CR>"),
  },
  opts = {
    position = "center",
  },
}
local section = {
  buttons = buttons,
  header = require("comfy.modules.ux.dashboard.theme.header"),
  footer = require("comfy.modules.ux.dashboard.theme.footer"),
}

local config = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
    { type = "padding", val = 2 },
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

return {
  button = button,
  section = section,
  config = config,
  leader = leader,
  opts = config,
}
