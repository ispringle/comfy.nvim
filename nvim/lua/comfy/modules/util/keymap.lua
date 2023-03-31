local M = {}

function M.setup(wk)
  wk.register({
    ["<leader>."] = {
      "<cmd>Telescop file_browser path=%:p:h select_buffer=true<cr>",
      "Browse directory",
    },
    ["<leader>/"] = {
      "<cmd>Telescop current_buffer_fuzzy_find<cr>",
      "Fuzzy search in current buffer",
    },
    ["<leader>f"] = {
      name = "+Find",
      b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
      c = { "<cmd>Telescope commands<cr>", "Search vim commands" },
      e = { "<cmd>Telescope symbols<cr>", "Find emojis/symbols" },
      f = { "<cmd>Telescope find_files<cr>", "Find file" },
      g = { "<cmd>Telescope live_grep<cr>", "Search CWD for string" },
      G = {
        name = "+Git",
        b = { "<cmd>Telescope git_branch<cr>", "Search and checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Search commit messages" },
        f = { "<cmd>Telescope git_files<cr>", "Find files tracked by git" },
        s = { "<cmd>Telescope git_status<cr>", "Find changed files" },
        S = { "<cmd>Telescope git_stash<cr>", "Find stashed files" },
      },
      m = { "<cmd>Telescope marks<cr>", "Search marks" },
      M = { "<cmd>Telescope man_pages<cr>", "Search for manpage" },
      n = { "<cmd>Telescope luasnip<cr>", "Search Luasnip snippets" },
      r = { "<cmd>Telescope registers<cr>", "Search register" },
      s = { "<cmd>Telescope grep_string<cr>", "Grep for word under cursor" },
      S = {
        "<cmd>Telescope spell_suggest<cr>",
        "List spelling suggests for word under cursor",
      },
      t = { "<cmd>Telescope treesitter<cr>", "Search current buffers AST" },
      u = { "<cmd>Telescope undo<cr>", "Search undo history" },
    },
    ["<leader>t"] = {
      name = "+Toggle",
      f = { "<cmd>FeMaco<cr>", "Open code block in scratch buffer" },
    },
  })
end

return M
