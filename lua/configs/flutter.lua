return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      { 
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
      }
    },
    config = function()
      -- TreeSitter setup
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "dart", "lua" },
        highlight = {
          enable = true,
        },
      }
      
      require('flutter-tools').setup({
        lsp = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand('$HOME/development/flutter/.pub-cache'),
              vim.fn.expand('$HOME/.pub-cache'),
              vim.fn.expand('$HOME/tools/flutter')
            }
          }
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {}
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = true
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = true
        },
        widget_guides = {
          enabled = true,
        }
      })

      local keymap = vim.keymap.set
      keymap('n', '<leader>fc', ':FlutterRun<CR>', { desc = 'Flutter: Run' })
      keymap('n', '<leader>fq', ':FlutterQuit<CR>', { desc = 'Flutter: Quit' })
      keymap('n', '<leader>fr', ':FlutterRestart<CR>', { desc = 'Flutter: Restart' })
      keymap('n', '<leader>fd', ':FlutterDevTools<CR>', { desc = 'Flutter: DevTools' })
    end
  }
}