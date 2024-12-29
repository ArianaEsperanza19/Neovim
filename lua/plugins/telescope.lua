-- Telescope is a powerful search plugin for Neovim that provides a highly extensible and configurable command-line interface for searching files, text, and more. It uses a popup-based interface to display search results clearly and efficiently, greatly enhancing developer productivity.
local builtin = require('telescope.builtin')
-- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Asigna la combinación de teclas <leader>fg al comando de Telescope para hacer búsqueda de texto en vivo (grep)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- Asigna la combinación de teclas <leader>fb al comando de Telescope para listar y buscar entre buffers abiertos
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- Asigna la combinación de teclas <leader>fh al comando de Telescope para buscar entre las etiquetas de ayuda
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Shorcut for nvim config files
vim.keymap.set("n", "<leader>nc", function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end)
-- Telescope extension
require('telescope').load_extension('vim_bookmarks')
-- Keybindings para abrir los pickers de marcas de telescope

