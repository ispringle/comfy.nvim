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
  'savq/paq-nvim'; -- The Paq Package Manager
  'nvim-lua/plenary.nvim'; -- Lua/Vim helper functions, req for many a plugin
  'Olical/aniseed'; -- A lang. for Lua. Req for something...
  -- 'rmagatti/auto-session'; -- TODO setup and use this
  'kyazdani42/nvim-web-devicons'; -- Icons, but not the Catholic sort
  -- 'yamatsum/nvim-nonicons'; -- web-devicons defaults
  'tpope/vim-repeat'; -- EZ repeat motions
  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' };
  'folke/which-key.nvim';
  'b0o/mapx.nvim';

  -- Telescope and Friends
  'nvim-telescope/telescope.nvim'; -- Le Supreme Fuzzy Finder
  'nvim-telescope/telescope-symbols.nvim';
  'sudormrfbin/cheatsheet.nvim';
  'cljoly/telescope-repo.nvim';
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };

  -- Treesitter and Friends
  { 'nvim-treesitter/nvim-treesitter', branch = vim.fn.has("nvim-0.6.0") == 1 and "master" or "0.5-compat", }; -- Syntax Crawling
  { 'nvim-treesitter/nvim-treesitter-textobjects', branch = vim.fn.has("nvim-0.6.0") == 1 and "master" or "0.5-compat", }; -- TODO setup some sweet textobjects
  'nvim-treesitter/nvim-treesitter-refactor'; -- Treesitter go-to definitions and such
  'JoosepAlviste/nvim-ts-context-commentstring'; -- Sets comment strings based on what treesitter says the lang at the cursor is
  'romgrk/nvim-treesitter-context'; -- Keeps context of current pos at top of file

  -- Language Server Protocol
  'neovim/nvim-lspconfig'; -- Language Server Protocol stuff
  'williamboman/nvim-lsp-installer'; -- Language Server Protocol installer
  'folke/trouble.nvim'; -- Better quickfix and diagnostic window
  { 'ray-x/navigator.lua', branch = 'nvim-lsp-installer' }; -- We use this to manage LSP setup
  'ray-x/lsp_signature.nvim'; -- LSP powered function signatures

  -- Completion
  { 'ms-jpq/coq_nvim', branch = 'coq' }; -- completion engine
  { 'ms-jpq/coq.artifacts', branch = 'artifacts' }; -- coq snippets
  { 'ms-jpq/coq.thirdparty', branch = '3p' }; -- coq integrations
  'windwp/nvim-autopairs';

  -- A E S T H E T I C
  'catppuccin/nvim';
  'lukas-reineke/indent-blankline.nvim';
  'hoob3rt/lualine.nvim';
  'SmiteshP/nvim-gps';
  -- 'folke/twilight.nvim'; -- Dim the text not near cursor

-- Buffer
  'akinsho/bufferline.nvim';
  'famiu/bufdelete.nvim';

  -- Editor Features
  'numToStr/Comment.nvim'; -- Comment stuff out
  'folke/todo-comments.nvim'; -- Highlight & Search for TODO keywords in src files
  'norcalli/nvim-colorizer.lua'; -- Highlight colorcodes with the color the reference
  'jghauser/mkdir.nvim'; -- mkdir on save if dir doesn't exist
  'blackCauldron7/surround.nvim'; -- like tpope's surround, but Luafied
  'ggandor/lightspeed.nvim'; -- vim-sneak w/ a jetpack
  'p00f/nvim-ts-rainbow'; -- rainbow parens
  'nacro90/numb.nvim'; -- peek at lines with :123
  'AllenDang/nvim-expand-expr'; -- define expressions and then "expand" them
  'sbulav/nredir.nvim'; -- redirect command output to buffer
  -- { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' };
  -- TODO investigate/try out neogen for auto code annotations

  -- Git
  'lewis6991/gitsigns.nvim';
  'ruifm/gitlinker.nvim';
  'sindrets/diffview.nvim';

  -- File
  'tamago324/lir.nvim';
  'tamago324/lir-git-status.nvim';
  'tamago324/lir-mmv.nvim';
  'tamago324/lir-bookmark.nvim';

  -- Buffers and Windows
  'ojroques/nvim-bufdel';
  'beauwilliams/focus.nvim';

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
