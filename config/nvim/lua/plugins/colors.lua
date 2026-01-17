return {
    -- Everforest
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
	            -- Default is "medium"
                background = "hard",
            })
        end
    },

    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                -- dark: wave, dragon; light: lotus
                theme = "wave",
            })
            vim.cmd("colorscheme kanagawa")
        end
    }
}



