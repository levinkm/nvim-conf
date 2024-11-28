require('core.keymaps')
return {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
  
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
  
        -- LSP keymaps
        keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
        keymap('n', 'K', vim.lsp.buf.hover, opts)
      end
  
      -- Python LSP (pyright)
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
            -- venvPath = vim.fn.expand("~/.virtualenvs"),  -- Added missing comma here
          }
        }
      })
  
      -- Go LSP (gopls)
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
  
      -- Dart/Flutter LSP (dartls)
      lspconfig.dartls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
  
      -- Kubernetes YAML LSP (yamlls)
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = {
            schemas = {
              kubernetes = "*.yaml",
            },
          }
        }
      })
    end
  }
  