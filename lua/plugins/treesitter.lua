return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "python", "go", "javascript", 
                    "typescript", "html", "css", "json",
                    "yaml", "markdown", "dockerfile", "dart"
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
            })
        end
    }
}