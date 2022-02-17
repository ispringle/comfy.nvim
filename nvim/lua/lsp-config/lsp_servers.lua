local path = require'nvim-lsp-installer.path'
local root = path.concat {vim.fn.stdpath 'data', 'lsp_servers/'}
local nb = "/node_modules/.bin/"
local vb = "/venv/bin/"

local function disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

local server_settings = {
  ansiblels = { cmd = { root.."ansiblels/bin/ansible_language_server" },},
  -- arduino_language_server = {},
  -- awk_ls = { cmd = { root.."awk_ls"..nb.."awk_language_server" }},
  bashls = { cmd = { root.."bashls"..nb.."bash-language-server" },},
  beancount = { cmd = { root.."beancount/beancount-langserver" },},
  ccls = { filetypes = {} }, -- disapble CCLS and use clangd
  clangd = { cmd = { root.."" },},
  cmake = { cmd = { root.."cmake"..vb.."cmake-language-server" },},
  cssls = { cmd = { root.."cssls"..nb.."vscode-css-language-server" },},
  cssmodules_ls = { cmd = { root.."cssmodules_ls"..nb.."cssmodules-language-server" },},
  clojure_lsp = { cmd = { root.."" },},
  diagnosticls = { cmd = { root.."diagnosticls"..nb.."diagnostic-languageserver" },},
  dockerls = { cmd = { root.."docker"..nb.."docker-langserver" },},
  -- efm = { cmd = { root.."efm/efm-langserver" },},
  eslint = { cmd = { root.."vscode-eslint"..nb.."vscode-eslint-language-server" },},
  emmet_ls = { cmd = { root.."emmet_ls"..nb.."emmet-ls" },},
  gopls = { cmd = { root.."go/gopls" },},
  graphql = { cmd = { root.."graphql"..nb.."graphql-lsp" },},
  html = { cmd = { root.."html"..nb.."vscode-html-language-server" },},
  -- jedi_language_server = {cmd = { root .. "jedi_language_server" .. vb .. "jedi-language-server"},},
  jsonls = { cmd = { root.."jsonls"..nb.."vscode-json-language-server" },},
  tsserver = { cmd = { root.."tsserver"..nb.."typescript-langauge-servr" },},
  texlab = { cmd = { root.."latex/texlab" },},
  sumneko_lua = { cmd = { root.."sumneko_lua/extension/server/bin/lua-language-server" },},
  remark_ls = { cmd = { root.."remark_ls"..nb.."remark-language-server" },},
  intelephense = { cmd = { root.."php"..nb.."intelephense" },},
  phpactor = { cmd = { root.."phpactor-source/bin/phpactor" },},
  -- pyright = { cmd = { root.."pyright"..nb.."pyright-langserver" },},
  pylsp = { cmd = { root .. "pylsp" .. vb .. "pylsp" },},
  rust_analyzer = { cmd = { root.."rust/rust-analyzer" },},
  sqls = {
    cmd = { root.."sqls/sqls" },
    -- on_attach = disable_formatting,
  },
  taplo = { cmd = { root.."taplo-lsp" },},
  vimls = { cmd = { root.."vim"..nb.."vim-language-server" },},
  lemminx = { cmd = { root.."lemminx/lemminx" },},
  yamlls = { cmd = { root.."yaml"..nb.."yaml-language-server" },},
  zeta_note = { cmd = { root.."zeta_note/zeta_note" },},
}

return server_settings
