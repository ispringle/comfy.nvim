local M = {}

function M.setup()
  -- coq settings
  vim.g.coq_settings = {
    keymap = { recommended = false }, -- for autopairs
    auto_start = true,
    ["display.pum.fast_close"] = false,
  }

  -- nvim-autopairs stuff
  local remap = vim.api.nvim_set_keymap
  local npairs = require('nvim-autopairs')

  npairs.setup({ map_bs = false })


  -- Redefine the same coq default mappings for better auto-pair compat
  remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
  remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
  remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
  remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

  -- skip it, if you use another global object
  _G.MUtils= {}

  MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        return npairs.esc('<c-y>')
      else
        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
      end
    else
      return npairs.autopairs_cr()
    end
  end
  remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

  MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
      return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
      return npairs.autopairs_bs()
    end
  end
  remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })


  -- Coq specific stuff
  require('coq')

  require('coq_3p') {
    { src = 'nvimlua', short_name = 'nLUA', conf_only = true },
    { src = 'repl', sh = 'fish'},
    { src = 'bc', short_name = 'MATH', precision = 6 },
  }
end

return M
