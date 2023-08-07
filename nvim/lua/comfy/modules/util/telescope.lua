local M = {}

function M.setup()
  require("telescope").setup({
    extensions = {
      file_browser = {
        hijack_netrw = true,
        mappings = {
          ["i"] = {},
          ["n"] = {},
        },
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      lazy = {
        show_icon = true,
      },
      undo = {},
    },
  })
  require("telescope").load_extension("fzf") -- moar speed

  require("telescope").load_extension("advanced_git_search")
  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("lazy")
  require("telescope").load_extension("luasnip")
  require("telescope").load_extension("undo")
end

return M
