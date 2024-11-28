return {
    -- Lazy.nvim plugin configuration
    {
        'nvim-lualine/lualine.nvim',  -- lualine plugin
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Required for icons support
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = { 'NvimTree', 'toggleterm' },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = {
                        'branch',
                        'diff',
                        { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' } },
                    },
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
            }
        end
    }
}
