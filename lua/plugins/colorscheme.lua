return {
    -- -- Gruvbox Material
    -- {
    --     "sainnhe/gruvbox-material",
    --     lazy = false, -- Load immediately
    --     priority = 1000, -- Ensure it loads first
    --     config = function()
    --         vim.cmd("colorscheme gruvbox-material") -- Set colorscheme
    --     end,
    -- },

    -- -- Tokyo Night
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "night", -- Options: night, storm, day, moon
    --             transparent = false,
    --         })
    --         vim.cmd("colorscheme tokyonight")
    --     end,
    -- },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
                transparent_background = false,
            })
            vim.cmd("colorscheme catppuccin")
        end,
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true, -- Load only when needed
    },
}
