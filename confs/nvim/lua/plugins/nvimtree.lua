return {

    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- disable netrw recommended by neotree
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

        -- 'a' -> Cretae file/directory
        -- 'r' -> Rename a file/directory
        -- 'R' -> Refresh the tree
        -- 'd' -> Delete a file/directory
        -- 'D' -> Trash a file/directory

        -- More shortcut: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
    end,
}

