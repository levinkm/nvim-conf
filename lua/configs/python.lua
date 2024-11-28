return {
    {
      'HallerPatrick/py_lsp.nvim',
      ft = 'python',
      config = function()
        require('py_lsp').setup({
          -- Django-specific settings
          auto_venv = true,
          venv_path = "venv",
          django_manage_path = "manage.py"
        })
      end
    },
    {
      'linux-cultist/venv-selector.nvim',
      dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim' },
      config = function()
        require('venv-selector').setup({
          name = {"venv", ".venv"},
          path = "~/.config/nvim/django-template"
        })
      end
    }
  }