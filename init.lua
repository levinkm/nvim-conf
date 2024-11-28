-- Disable some built-in plugins
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Add custom configuration options
-- Stay on current version of venv-selector.nvim (if you prefer)
vim.g.venv_selector_stay_on_this_version = false

-- Set session options for auto-session
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,localoptions"

-- Import core modules
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Management
require("lazy").setup({
  { import = "plugins" },
  { import = "configs" }
})

require("nvim-web-devicons").setup({
    default = true, -- Enable default icons for unsupported file types
})
