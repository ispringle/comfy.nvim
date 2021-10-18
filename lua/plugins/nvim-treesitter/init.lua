return function()
  local function get_ts_parsers(langs)
    local langs = {}

    for _, lang in ipairs(langs) do
      -- If the lang is config then add parsers for JSON, YAML and TOML
      if lang == "config" then
        table.insert(langs, "json")
        table.insert(langs, "yaml")
        table.insert(langs, "toml")
      else
        lang = lang:gsub("%s+%+lsp", ""):gsub("%s+%+debug", "")
        table.insert(langs, lang)
      end
    end

    -- Add TSX parser if TypeScript is enabled
    if has_value(langs, "typescript") then
      table.insert(langs, "tsx")
    end
    return langs
  end

  -- macos uses wrong c version
  require("nvim-treesitter.install").compilers = { "gcc" }

  langs = {
    "html",
    "css",
    "javascript",
    "typescript",
    "bash",
    "python",
    "lua",
    "rust",
    "go",
    "config",
    "dockerfile",
  }

  require("nvim-treesitter.configs").setup({
    ensure_installed = get_ts_parsers(langs),
    highlight = { enable = true },
    autopairs = {
      enable = true,
    },
    indent = { enable = true },
    tree_docs = { enable = true },
    context_commentstring = { enable = true },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "markdown",
        "python",
        "rust",
      },
    },
  })
end 
