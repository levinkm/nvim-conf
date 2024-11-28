-- lua/plugins/productivity.lua

return {
    -- Terminal Integration
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                direction = "horizontal",
            })
        end,
    },

    -- Session Management
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
                -- Optional settings for session
                session_lens = {
                    theme = "dropdown",  -- can change the theme to 'ivy' or 'cursor'
                    previewer = false,   -- Disable previewer
                },
            })
        end,
    },

    -- Motion and Navigation
    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup()
            -- Mapping for HopChar2
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<CR>", { silent = true, noremap = true })
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    },

    -- Commenting
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Code Folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    -- Choose which providers to use for folding (treesitter and indent)
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },

    -- Performance and Optimization
    {
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
        end,
    },

    {
        "folke/persistence.nvim",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load() -- Load VS Code snippets
        end,
    },

    -- Autocompletion Copilot
    {
        "github/copilot.vim",
        config = function()
            -- Enable Copilot and set up keymap for accepting suggestions
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
        end,
    },

    -- brackets colors

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
      },
    ---- Additional text objects via treesitter
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
      },
      -- Documentation generation
      {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
          require("neogen").setup({
            enabled = true,
            languages = {
              python = {
                template = {
                  annotation_convention = "google_docstrings"
                }
              },
              go = {
                template = {
                  annotation_convention = "godoc"
                }
              }
            }
          })
          vim.keymap.set("n", "<Leader>nc", ":lua require('neogen').generate()<CR>", { desc = "Generate documentation" })
        end
      }
}
