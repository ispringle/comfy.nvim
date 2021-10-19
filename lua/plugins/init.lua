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

require('paq'){
  -- The Bear Essentials
  'savq/paq-nvim'; -- The Paq Package Manager
  'nvim-lua/plenary.nvim'; -- Lua/Vim helper functions, req for many a plugin
  'Olical/aniseed'; -- A lang. for Lua. Req for something...
  -- "folke/persistence.nvim"; -- Session Management
  'nvim-telescope/telescope.nvim'; -- Le Supreme Fuzzy Finder
  'kyazdani42/nvim-web-devicons'; -- Icons, but not the Catholic sort
  -- 'yamatsum/nvim-nonicons'; -- web-devicons defaults
  'tpope/vim-repeat'; -- EZ repeat motions
  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' };
  'folke/which-key.nvim';

  -- Treesitter and Friends
  { 'nvim-treesitter/nvim-treesitter', branch = vim.fn.has("nvim-0.6.0") == 1 and "master" or "0.5-compat", }; -- Syntax Crawling
  'nvim-treesitter/nvim-treesitter-refactor'; -- Treesitter go-to definitions and such
  'JoosepAlviste/nvim-ts-context-commentstring'; -- Sets comment strings based on what treesitter says the lang at the cursor is

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

  -- A E S T H E T I C S
  'Pocco81/Catppuccino.nvim';
  'lukas-reineke/indent-blankline.nvim';
  -- 'glepnir/dashboard-nvim'; -- It's a... dashboard... duh
  -- 'folke/twilight.nvim'; -- Dim the text not near cursor

  -- Editor Features
  'numToStr/Comment.nvim'; -- Comment stuff out
  'folke/todo-comments.nvim'; -- Highlight & Search for TODO keywords in src files
  'TimUntersberger/neogit'; -- Magit, but in Blessed Neovim
  'norcalli/nvim-colorizer.lua'; -- Highlight colorcodes with the color the reference
  'jghauser/mkdir.nvim'; -- mkdir on save if dir doesn't exist
  'blackCauldron7/surround.nvim'; -- like tpope's surround, but Luafied
  'ggandor/lightspeed.nvim'; -- vim-sneak w/ a jetpack

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
}

require("telescope").setup()
require("plugins.treesitter").setup()

require('Comment').setup()
require("todo-comments").setup{}
require('colorizer').setup()
require('mkdir')
require('surround').setup({ mapping_style = "surround" })
require('lightspeed')

require('plugins.windows').setup()
require('bufdel').setup({ next = 'cycle', quit = true, })

require('plugins.terminal').setup()

require('plugins.keymap').setup()
