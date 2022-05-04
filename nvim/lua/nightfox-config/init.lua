require('nightfox').setup({
  options = {
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false, -- Non focused panes set to alternative background
    styles = {
      comments = "italic",
      types = "italic,bold",
      constants = "bold",
    }
  }
})

vim.cmd('colorscheme duskfox')
