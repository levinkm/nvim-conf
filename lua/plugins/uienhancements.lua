return {

    -- barbecue.nvim configuration
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- For icons support
            "neovim/nvim-lspconfig",       -- Ensure LSP is installed
        },
        config = function()
            require("barbecue").setup({
                attach_navic = true, -- Automatically attach to `nvim-navic`
                create_autocmd = true, -- Auto-update on file changes
                show_modified = true, -- Display a modification indicator for the buffer
                theme = "auto", -- Match colorscheme automatically
                symbols = {
                    modified = "●", -- Symbol for modified buffers
                    ellipsis = "…", -- Ellipsis for truncated context
                    separator = ">", -- Separator symbol
                },
                kinds = {
                    Class = " ",          -- Class symbol (Traditional box symbol for class)
                    Constant = " ",       -- Constant symbol (A constant representation)
                    Constructor = " ",    -- Constructor symbol (A constructor representation, similar to function)
                    Enum = " ",           -- Enum symbol (Standard symbol for enum)
                    Function = "ƒ ",       -- Function symbol (Using the character 'ƒ' to represent a function)
                    Interface = "ﰮ ",      -- Interface symbol (A common representation for interface)
                    Method = " ",        -- Method symbol (A wrench-like symbol for methods, similar to functions)
                    Module = " ",         -- Module symbol (A box symbol indicating a module)
                    Namespace = " ",     -- Namespace symbol (Representation for a namespace)
                    Property = " ",       -- Property symbol (A simple property symbol)
                    Struct = " ",         -- Struct symbol (Traditional struct representation)
                    Variable = " ",      -- Variable symbol (Represents variables in a concise way)
                    Event = " ",          -- Event symbol (Symbol for events)
                    Type = " ",           -- Type symbol (A symbol for types in code)
                    Field = " ",          -- Field symbol (For fields within structures or classes)
                    EnumMember = " ",    -- Enum Member symbol (A standard enum member representation)
                    Operator = " ",      -- Operator symbol (A symbol for operators like +, -, etc.)
                }
            })
    
            -- Ensure `nvim-navic` is properly configured
            local navic = require("nvim-navic")
            require("lspconfig").pyright.setup({
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentSymbolProvider then
                        navic.attach(client, bufnr)
                    end
                end,
            })
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
          "nvim-web-devicons",  -- For icons support
        },
        config = function()
            require("nvim-tree").setup({
                auto_close = true,           -- Automatically close the tree when opening a file
                open_on_start = true,        -- Open the tree on startup (replaces open_on_setup)
                update_focused_file = {
                  enable = true,             -- Update the file in the tree when focused
                  update_cwd = true,         -- Update the working directory based on the file
                },
              })
        end,
    }
}
