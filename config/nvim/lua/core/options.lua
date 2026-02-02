vim.opt.termguicolors = true
vim.opt.number = true	
vim.opt.relativenumber = true	
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Tabs, spaces, indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "88"
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = false
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Configure how new splits should be opened
vim.opt.splitright = true   -- C-w-v
vim.opt.splitbelow = true   -- C-w-s
-- Move from one buffer to another: <C-w><h,j,k,l>
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- No swapfile
vim.opt.swapfile = false
