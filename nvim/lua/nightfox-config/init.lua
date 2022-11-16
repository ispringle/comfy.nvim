require('nightfox').setup({
  options = {
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true, -- Non focused panes set to alternative background
    styles = {
      comments = "italic",
      functions = "italic",
      types = "italic,bold",
      constants = "bold",
      operators = "bold",
    }
  }
})

vim.cmd('colorscheme duskfox')
