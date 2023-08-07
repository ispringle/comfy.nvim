local module = "notetaking"
local M = {
  dir = module,
  name = module,
  cond = true,
  priority = 500,
  dependencies = {
    {
      "jakewvincent/mkdnflow.nvim",
      lazy = false,
      dependencies = "rktjmp/lush.nvim",
    },
  },
}

function M.config()
  local vim = vim

  vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
  vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})

  require('mkdnflow').setup({
    perspective = {
      priority = 'root',
      root_tell= 'root.md',
    },
    links = {
      style = 'markdown',
      transform_explicit = false,
    }
  })
end

return M
