vim.g.mapleader = "," -- set mapleader to ,
vim.g.maplocalleader = ","
vim.g.editorconfig = true

vim.opt.compatible = false -- don't try to be vi compatible
vim.opt.termguicolors = true -- use 24-bit colors
vim.opt.signcolumn = 'yes:3' -- reserve space in gutter
vim.opt.smarttab = true -- let tab and backspace work like in IDEs
vim.opt.modelines = 0 -- disable modelines (security?!)
vim.opt.number = true -- enable line numbers
vim.opt.ruler = true -- enable ruler
vim.opt.visualbell = true -- blink instead of beep on error
vim.opt.encoding = 'utf-8' -- set encoding
vim.opt.wrap = true -- enable line wrap
vim.opt.textwidth = 79 -- set line width
vim.opt.formatoptions = 'tcqrn1' -- set some formatoptions
vim.opt.tabstop = 2 -- set tabs to be displayed as 2*' '
vim.opt.shiftwidth = 2 -- set indent width
vim.opt.softtabstop = 2 -- set softtabstop (edit mode)
vim.opt.expandtab = true -- enable expandtab to insert spaces on <tab>
vim.opt.shiftround = false -- disable indent rounding

vim.opt.scrolloff = 3 -- keep curser away from edge
vim.opt.backspace = 'indent,eol,start' -- set backspace options
vim.opt.hidden = true -- enable hidden buffers
vim.opt.ttyfast = true -- enable smooth tty
vim.opt.laststatus = 2 -- enable status also for last window
vim.opt.showmode = true -- show mode in last line
vim.opt.showcmd = true -- show cmd in last line

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- load plugin config
require('config.lazy')

