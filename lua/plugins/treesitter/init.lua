local M = {}

function M.setup()
  local ts = require('nvim-treesitter.configs')
  ts.setup {
    ensure_installed = 'maintained',
    ignore_install = {
      "c_sharp",
      "cuda",
      "dart",
      "devicetree",
      "gdscript", "gdresource",
      "glsl",
      "hcl",
      "heex",
      "ocaml", "ocaml_interface", "ocamllex",
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
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
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
  }
end

return M
