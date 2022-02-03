local M = {}
local cmd = vim.cmd

function M.augroup(name, autocmds)
  cmd('augroup '..name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd '..table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
