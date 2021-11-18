local M = {}

function M.setup()
  local catppuccin = require("catppuccin")

  catppuccin.before_loading = function()
  end

  -- configure it
  catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = true,
      lsp_saga = false,
      gitgutter = true,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = false,
        show_root = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = false,
      neogit = false,
      vim_sneak = true,
      fern = false,
      barbar = true,
      bufferline = false,
      markdown = false,
      lightspeed = true,
      ts_rainbow = true,
      hop = false,
    },
  }
  )

  vim.cmd[[colorscheme catppuccin]]
end

return M
