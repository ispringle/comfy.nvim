local M = {}

M.opts = {
  spec = {
	  { import = "plugins"},
  },
  git = {
    log = { "--since=3 days ago" },
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  dev = {
    path = "~/git/hub/ispringle",
    patterns = {}, -- For example {"folke"}
    fallback = true,
  },
  install = {
    missing = true,
    colorscheme = { "habamax" },
  },
  ui = {
    custom_keys = {
      -- open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,

      -- open a terminal for the plugin dir
      ["<localleader>t"] = function(plugin)
        require("lazy.util").float_term(nil, {
          cwd = plugin.dir,
        })
      end,
    },
  },
  diff = {
    cmd = "git",
  },
  checker = {
    enabled = true,
  },
  change_detection = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

function M.bootstrap()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
	  vim.fn.system({
	    "git",
	    "clone",
	    "--filter=blob:none",
	    "https://github.com/folke/lazy.nvim.git",
	    "--branch=stable", -- latest stable release
	    lazypath,
	  })
	end
	vim.opt.rtp:prepend(lazypath)
end

function M.setup()
	M.bootstrap()

	local lazy = require('lazy')
	lazy.setup(M.opts)

end

return M
