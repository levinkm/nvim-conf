return {
    {
      'ray-x/go.nvim',
      dependencies = {
        'ray-x/guihua.lua',
        'neovim/nvim-lspconfig',
      },
      config = function()
        require('go').setup({
          gofmt = 'gopls',   -- Use gopls for formatting
          max_line_len = 120,
          tag_transform = false,
          test_dir = '',
          comment_placeholder = '   ',
          lsp_cfg = true,    -- Use default lsp configuration
          lsp_gofumpt = true, -- Use gofumpt for strict formatting
          lsp_diag_signs = true,
          dap_debug = true,  -- Enable debugging
          dap_debug_gui = true, -- Enable GUI-based debugging
          linter = 'golangci-lint',
          linter_flags = {'--fast'},
          test_runner = 'go', -- Test runner configuration
          verbose_tests = true,
        })
  
        -- Go-specific keymaps
        local keymap = vim.keymap.set
        keymap('n', '<leader>gi', ':GoInstallDeps<CR>', { desc = 'Install Go dependencies' })
        keymap('n', '<leader>gt', ':GoTest<CR>', { desc = 'Run Go tests' })
        keymap('n', '<leader>gcc', ':GoCoverage<CR>', { desc = 'Run Go coverage' })
      end,
      event = {'CmdlineEnter'},
      ft = {'go', 'gomod'},
      build = ':go install github.com/go-delve/delve/cmd/dlv@latest'  -- Ensure delve is installed
    },
    {
      'leoluz/nvim-dap-go',
      ft = 'go',
      dependencies = {
        'mfussenegger/nvim-dap',
      },
      config = function()
        require('dap-go').setup({
          dap_configurations = {
            {
              type = "go",
              name = "Debug",
              request = "launch",
              program = "${file}",
            },
          },
        })
      end
    }
  }
  