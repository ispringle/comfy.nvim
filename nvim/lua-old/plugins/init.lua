local fn = vim.fn
-- Set paq install path
local install_path = fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim'

-- Bootstrap Packer
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/savq/paq-nvim.git',
    install_path
  })
end

local paq = require('paq')
paq {
  -- The Bear Essentials
  -- 'rmagatti/auto-session'; -- TODO setup and use this
  -- 'yamatsum/nvim-nonicons'; -- web-devicons defaults
  'tpope/vim-repeat'; -- EZ repeat motions
  'folke/which-key.nvim';

  -- Telescope and Friends
  'nvim-telescope/telescope.nvim'; -- Le Supreme Fuzzy Finder
  'nvim-telescope/telescope-symbols.nvim';
  'sudormrfbin/cheatsheet.nvim';
  'cljoly/telescope-repo.nvim';
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };

  -- Treesitter and Friends
  -- A E S T H E T I C
  'SmiteshP/nvim-gps';
  -- 'folke/twilight.nvim'; -- Dim the text not near cursor

  'sbulav/nredir.nvim'; -- redirect command output to buffer

  -- Git
  'lewis6991/gitsigns.nvim';
  'ruifm/gitlinker.nvim';
  'sindrets/diffview.nvim';

  -- File
  'tamago324/lir.nvim';
  'tamago324/lir-git-status.nvim';
  'tamago324/lir-mmv.nvim';
  'tamago324/lir-bookmark.nvim';

  -- Productivity
  'oberblastmeister/neuron.nvim';

  -- Terminal
  'akinsho/toggleterm.nvim';
  'tknightz/telescope-termfinder.nvim';

  -- Language Support
  'folke/lua-dev.nvim';
  'rafcamlet/nvim-luapad';
  'gennaro-tedesco/nvim-jqx';
}

-- Auto install plugins _before_ we run them to hopefully avoid the ugly red wall on start-up
paq.install()

  -- Telescope and Friends
require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  }
})

-- So much random stuff depends on the colorscheme being loaded before _or_
-- after, but not either. So I'll just load it twice.
require('modules/aesthetic/plugins/colorscheme').setup()

require('cheatsheet').setup()
require('telescope').load_extension('repo')
require('telescope').load_extension('fzf')

require("plugins.treesitter").setup()
require('plugins.which-key').setup()

require('Comment').setup()
require("todo-comments").setup{}
require('colorizer').setup()
require('mkdir')
require('surround').setup({ mapping_style = "surround" })
require('lightspeed')
require('numb').setup()

require('nvim-jqx.config')
