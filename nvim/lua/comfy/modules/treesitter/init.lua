local module = "treesitter"
local M = {
  dir = module,
  name = module,
  cond = true,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false },
    "nvim-treesitter/nvim-treesitter-textobjects", -- TODO: setup textobjects
    "nvim-treesitter/nvim-treesitter-refactor", -- Treesitter go-to definitions and such
    "JoosepAlviste/nvim-ts-context-commentstring", -- Sets comment strings based on what treesitter says the lang at the cursor is
    "romgrk/nvim-treesitter-context", -- Keeps context of current pos at top of file
    "windwp/nvim-ts-autotag", -- Close html/xml/etc tags
  },
}

function M.config()
  local ts = require("nvim-treesitter.configs")
  ts.setup({
    autotag = { enable = true },
    ensure_installed = "all",
    ignore_install = {
      "c_sharp",
      "cuda",
      "dart",
      "devicetree",
      "gdscript",
      "gdresource",
      "glsl",
      "hcl",
      "heex",
      "norg",
      "ocaml",
      "ocaml_interface",
      "ocamllex",
      "pioasm",
      "sparql",
      "supercollider",
      "surface",
      "tlaplus",
      "verilog",
    },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    require("treesitter-context").setup({
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      throttle = true, -- Throttles plugin updates (may improve performance)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      patterns = {
        -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          "class",
          "function",
          "method",
          "for", -- These won't appear in the context
          "while",
          "if",
          "switch",
          "case",
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
      },
    }),
  })

  local fname = vim.fn.expand("%:p:f")
  local fsize = vim.fn.getfsize(fname)
  if fsize > 1024 * 1024 then
    print("disable syntax_folding")
    vim.api.nvim_command("set foldmethod=indent")
    return
  end
  vim.api.nvim_command("set foldmethod=expr")
  vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
end

return M
