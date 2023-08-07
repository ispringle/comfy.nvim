
local module = "lang"
local M = {
  dir = module,
  name = module,
  cond = false,
  dependencies = {
    {
      'jonsmithers/vim-html-template-literals',
      dependencies = {
        'pangloss/vim-javascript',
        'leafgarland/typescript-vim'
      },
    },
  },
}

function M.config()
end

return M
