return {
    -- Remove the pulumi-ls plugin from the setup
    -- {
    --   'pulumi/pulumi-ls',
    --   ft = {'typescript', 'javascript', 'python', 'go'},
    --   config = function()
    --     require('lspconfig').pulumictl.setup({
    --       cmd = { 'pulumi-ls' },
    --       filetypes = {'typescript', 'javascript', 'python', 'go'},
    --       root_dir = require('lspconfig.util').root_pattern('Pulumi.yaml', 'pulumi.yaml'),
    --       settings = {
    --         pulumi = { enableTelemetry = false }
    --       },
    --       on_attach = function(client, bufnr)
    --         local keymap = vim.keymap.set
    --         keymap('n', '<leader>pp', ':!pulumi preview<CR>', { buffer = bufnr })
    --         keymap('n', '<leader>pup', ':!pulumi up<CR>', { buffer = bufnr })
    --         keymap('n', '<leader>pd', ':!pulumi destroy<CR>', { buffer = bufnr })
    --       end
    --     })
    --   end
    -- },
    
    {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = {
            'typescript', 'javascript', 'python', 'go', 'yaml', 'json'
          }
        })
      end
    }
  }
  