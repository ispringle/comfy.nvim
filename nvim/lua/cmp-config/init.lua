local M = {}

function M.setup()
  local cmp = require('cmp')
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  local luasnip = require("luasnip")
  local function tab(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      -- F("<Tab>")
      fallback()
    end
  end

  local sources = {
    {name = 'luasnip'},
    {name = 'treesitter', keyword_length = 2},
    { name = "nvim_lsp" },
    { name = "calc" },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "emoji" },
    {name = 'look', keyword_length = 4}
  }
  if vim.o.ft == 'sql' then
    table.insert(sources, {name = 'vim-dadbod-completion'})
  end

  if vim.o.ft == 'norg' then
    table.insert(sources, {name = 'neorg'})
  end
  if vim.o.ft == 'markdown' then
    table.insert(sources, {name = 'spell'})
  end
  if vim.o.ft == 'lua' then
    table.insert(sources, {name = 'nvim_lua'})
  end
  cmp.setup {
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
        -- require 'snippy'.expand_snippet(args.body)
        -- vim.fn["UltiSnips#Anon"](args.body)
      end
    },
    completion = {
      autocomplete = {require("cmp.types").cmp.TriggerEvent.TextChanged},
      completeopt = "menu,menuone,noselect"
    },
    formatting = {
      format = function(entry, vim_item)
        -- print(vim.inspect(vim_item.kind))
        if cmp_kind == nil then
          cmp_kind = require"navigator.lspclient.lspkind".cmp_kind
        end
        vim_item.kind = cmp_kind(vim_item.kind)
        vim_item.menu = ({
          buffer = "[BUF]",
          nvim_lsp = "[LSP]",
          luasnip = "[SNP]",
          treesitter = "[TRE]",
          nvim_lua = "[LUA]",
          spell = "[DCT]",
          calc = "[CAL]",
          path = "[PTH]",
          emoji = "[EMJ]",
          look = "[LOK]",
        })[entry.source.name]
        return vim_item
      end
    },
    -- documentation = {
    --   border = "rounded",
    -- },
    -- You must set mapping if you want.
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
      -- ['<Tab>'] = cmp.mapping(tab, {'i', 's'}),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {"i", "s"})

    },

    -- You should specify your *installed* sources.
    sources = sources,

    experimental = {ghost_text = true}
  }
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
  cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
  cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "lisp"
  cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "cl"

  require'cmp'.setup.cmdline(':', {sources = {{name = 'cmdline'}}})
  require'cmp'.setup.cmdline('/', {sources = {{name = 'buffer'}}})
  if vim.o.ft == 'clap_input' or vim.o.ft == 'guihua' or vim.o.ft == 'guihua_rust' then
    require'cmp'.setup.buffer {completion = {enable = false}}
  end
  vim.cmd("autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }")
  vim.cmd("autocmd FileType clap_input lua require('cmp').setup.buffer { enabled = false }")
end

M.setup()
