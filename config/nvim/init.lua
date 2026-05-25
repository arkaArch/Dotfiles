-- ===================================================
-- OPTIONS
-- ===================================================
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "88"

vim.opt.number = true	
vim.opt.relativenumber = true	

vim.opt.mouse = 'a'
vim.opt.showmode = false  -- mode already shown in the status line
vim.opt.clipboard = 'unnamedplus'  -- sync clipboard between distro and nvim.

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.undofile = false
vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'

vim.opt.splitright = true
vim.opt.splitbelow = true



-- ===================================================
-- KEYMAPS
-- ===================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')  -- escape from highligting search

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight during 'yap' (and 'dap')
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Terminal in neovim
-- Keymaps and behaviour
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('open-terminal', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
-- Open terminal
vim.keymap.set("n", "<leader>ot", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.api.nvim_win_set_height(0, 20)
    vim.cmd("startinsert")
end)
-- Close terminal
vim.keymap.set("t", "<leader>ct", "<Esc><C-\\><C-n>:q<Enter>")



-- ===================================================
-- PLUGINS
-- ===================================================
vim.pack.add({
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/neovim/nvim-lspconfig',
})

-- Colorscheme and transparency (kanagawa)
require("kanagawa").load("wave")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Status bar (Lualine)
require("lualine").setup({ options = { theme = 'tomorrow_night' } })

-- Indent line (indent-blankline)
require("ibl").setup()


-- File explorer(nvim-tree)
-- Disable netrw recommended by neotree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort = { sorter = "case_sensitive", },
    view = { width = 30, },
    renderer = { group_empty = true, },
    filters = { dotfiles = true, }, 
})

-- Set keymaps
vim.keymap.set("n", "<leader>eo", "<cmd>NvimTreeFocus<CR>",    {desc = "Open and focus."} )
vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>",   {desc = "Toggle(Open/Close)."} )
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {desc = "Collapses folders recursively."} )

-- {    
--   'a' -> Create file/directory
--   'r' -> Rename a file/directory
--   'R' -> Refresh the tree
--   'd' -> Delete a file/directory
--   'D' -> Trash a file/directory
-- }



-- ===================================================
-- LSP CONFIG
-- ===================================================
vim.lsp.enable({ "clang" })

vim.lsp.config('clang', {
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt' },
})

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
