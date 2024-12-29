-- vim-bookmarks is a Vim plugin that allows setting and managing bookmarks in specific lines of your files. These bookmarks can be used to mark important lines, and you can navigate between them easily. Annotations can also be added to bookmarks, which is useful for preparing code reviews.
-- Requerir y configurar los plugins
require('telescope').load_extension('marks')
require('vim-bookmarks')

-- Configura bookmarks persistentes
vim.g.bookmark_auto_save = 1
vim.g.bookmark_auto_save_file = vim.fn.expand('~/.vim-bookmarks')

-- Atajos para gestionar las marcas con vim-bookmarks
vim.api.nvim_set_keymap('n', 'mm', ':BookmarkToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mi', ':BookmarkAnnotate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ma', ':BookmarkShowAll<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mn', ':BookmarkNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mp', ':BookmarkPrev<CR>', { noremap = true, silent = true })

-- Atajo para abrir Telescope marks
vim.api.nvim_set_keymap('n', '<leader>fm', ':Telescope marks<CR>', { noremap = true, silent = true })

-- Función para mostrar la anotación de la marca actual
-- function ShowCurrentBookmarkAnnotation()
--   local line = vim.fn.line('.')
--   local annotation = vim.fn['bm#sign#get_annotation'](vim.fn.bufnr('%'), line)
--   if annotation == '' then
--     print('No hay anotación para esta marca')
--   else
--     print('Anotación: ' .. annotation)
--   end
-- end

-- Atajo para mostrar la anotación de la marca actual
vim.api.nvim_set_keymap('n', 'ms', ':lua ShowCurrentBookmarkAnnotation()<CR>', { noremap = true, silent = true })


