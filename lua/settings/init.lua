-- Ergonomics
local set = vim.opt

local o = vim.o
local bo = vim.bo
local wo = vim.bo

local g = vim.g

local cmd = vim.cmd

local utils = require('utils')

set.swapfile = true
set.dir = '/tmp'
set.smartcase = true
set.ignorecase = true
set.laststatus = 2
set.hlsearch = true
set.incsearch = true
set.conceallevel = 0
set.autoread = true
set.mouse = 'a'
set.hidden = true
set.showmatch = true
set.wrap = true
set.splitright = true
--o.nocompatible = true
set.clipboard = 'unnamedplus'
set.scrolloff = 8
set.sidescrolloff = 5

-- Line numbers
set.number = true

-- Tab settings
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.shiftround = true

-- Folding
set.foldenable = true
set.foldlevelstart = 10
set.foldlevel = 10
set.foldmethod = 'indent'

cmd('syntax on')

-- Cache dirs
set.backupdir = '$HOME/.local/share/nvim/backups/'
set.dir = '$HOME/.local/share/nvim/swap/'
set.undodir = '$HOME/.local/share/nvim/undo/'

-- augroups
utils.augroup('specify_filetype', {
  { 'BufRead,BufNewFile', '*.md', 'set', 'filetype=markdown' },
  { 'BufRead,BufNewFile', '*.txt', 'set', 'filetype=text' },
})

utils.augroup('numbertoggle', {
  { 'BufEnter,FocusGained,InsertLeave', '*', 'set', 'relativenumber'},
  { 'BufLeave,FocusLost,InsertEnter', '*', 'set', 'norelativenumber'},
})

