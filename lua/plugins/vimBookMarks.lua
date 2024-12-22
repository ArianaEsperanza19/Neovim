-- Requerir y configurar los plugins
require('telescope').load_extension('marks')
require('vim-bookmarks')

-- Atajos para gestionar las marcas con vim-bookmarks
vim.api.nvim_set_keymap('n', 'mm', ':BookmarkToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mi', ':BookmarkAnnotate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ma', ':BookmarkShowAll<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mn', ':BookmarkNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mp', ':BookmarkPrev<CR>', { noremap = true, silent = true })

-- Atajo para abrir Telescope marks
vim.api.nvim_set_keymap('n', '<leader>fm', ':Telescope marks<CR>', { noremap = true, silent = true })

