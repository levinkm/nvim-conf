return {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("venv-selector").setup({
            name = {
                "venv",
                ".venv",
                "env",
                ".env",
            },
            path = vim.fn.expand("~/.virtualenvs")  -- Adjust this path to your virtualenvs directory
            -- stay_on_this_version = true  -- Remove this line to upgrade
        })
    end
}
