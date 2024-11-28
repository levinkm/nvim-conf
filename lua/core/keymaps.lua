local keymap = vim.keymap.set

-- General Keymaps
keymap('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
keymap('n', 'x', '"_x', { desc = 'Delete single character without copying' })

-- Split window management
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', ':close<CR>', { desc = 'Close current split' })

-- Diagnostic Keymaps
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Django-specific mappings
vim.keymap.set('n', '<leader>dm', ':term python manage.py ', { desc = 'Django manage.py' })
vim.keymap.set('n', '<leader>ds', ':term python manage.py runserver', { desc = 'Django runserver' })
vim.keymap.set('n', '<leader>dsh', ':term python manage.py shell_plus', { desc = 'Django shell plus' })
vim.keymap.set('n', '<leader>dm', ':term python manage.py migrate', { desc = 'Django migrate' })

-- Virtualenv Selector mapping
vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>", { noremap = true, silent = true, desc = "Select Virtual Environment" })