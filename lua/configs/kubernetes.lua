return {
    {
      'someone-stole-my-name/yaml-companion.nvim',
      dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
      },
      config = function()
        require('yaml-companion').setup({
          builtin_matchers = {
            -- Kubernetes resources
            kubernetes = {
              patterns = {
                '*.yaml',
                '*.yml',
                '*.k8s'
              }
            }
          },
          schemas = {
            {
              name = "Kubernetes",
              uri = "https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"
            }
          }
        })
  
        -- Kubernetes-specific keymaps
        local keymap = vim.keymap.set
        keymap('n', '<leader>kgp', ':!kubectl get pods<CR>', { desc = 'Get Kubernetes Pods' })
        keymap('n', '<leader>kgd', ':!kubectl get deployments<CR>', { desc = 'Get Kubernetes Deployments' })
        keymap('n', '<leader>kgs', ':!kubectl get services<CR>', { desc = 'Get Kubernetes Services' })
      end
    }
  }