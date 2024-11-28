return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",      -- LSP source
            "hrsh7th/cmp-buffer",        -- Buffer source
            "hrsh7th/cmp-path",          -- Path source
            "L3MON4D3/LuaSnip",          -- Snippets plugin
            "saadparwaiz1/cmp_luasnip",  -- LuaSnip source for nvim-cmp
            "rafamadriz/friendly-snippets", -- Additional snippets
        },
        config = function()
            -- Load LuaSnip and snippets
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Load custom snippets from your snippets folder
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

            -- nvim-cmp configuration
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) 
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),       -- Scroll docs backward
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),        -- Scroll docs forward
                    ['<C-Space>'] = cmp.mapping.complete(),        -- Trigger completion
                    ['<C-e>'] = cmp.mapping.abort(),               -- Abort completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim-lsp' }, -- LSP completion
                    { name = 'luasnip' }, -- Snippet completion
                    { name = 'buffer' },  -- Buffer completion
                    { name = 'path' },    -- File path completion
                }),
            })

            -- Setup completion for specific filetypes (e.g., gitcommit)
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "buffer" },
                }),
            })

            -- Command-line completion (e.g., `:` for commands, `/` for searches)
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },   -- Path completions for file paths
                }, {
                    { name = "cmdline" }, -- Command-line completions (e.g., :w, :q)
                }),
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },  -- Search buffer contents
                },
            })
        end,
    },
}
