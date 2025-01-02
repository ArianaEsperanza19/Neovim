-- Telescope is a powerful search plugin for Neovim that provides a highly extensible and configurable command-line interface for searching files, text, and more. It uses a popup-based interface to display search results clearly and efficiently, greatly enhancing developer productivity.

-- local builtin = require('telescope.builtin')
--
-- -- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--
-- -- Asigna la combinación de teclas <leader>t al comando de Telescope para hacer búsqueda de texto en vivo (grep)
-- vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope live_grep<CR>', { noremap = true, silent = true })
--
-- -- Asigna la combinación de teclas <leader>fb al comando de Telescope para listar y buscar entre buffers abiertos
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--
-- -- Asigna la combinación de teclas <leader>fh al comando de Telescope para buscar entre las etiquetas de ayuda
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--
-- -- Shorcut for nvim config files
-- vim.keymap.set("n", "<leader>nc", function()
--     builtin.find_files { cwd = vim.fn.stdpath 'config' }
-- end)
--
-- -- Telescope extension
-- require('telescope').load_extension('vim_bookmarks')
-- -- Keybindings para abrir los pickers de marcas de telescope
--
-- local actions = require("telescope.actions")
-- local open_with_trouble = require("trouble.sources.telescope").open
--
-- -- Use this to add more results without clearing the trouble list
-- local add_to_trouble = require("trouble.sources.telescope").add
--
-- local telescope = require("telescope")
--
-- telescope.setup({
--   defaults = {
--     mappings = {
--       i = { ["<c-t>"] = open_with_trouble },
--       n = { ["<c-t>"] = open_with_trouble },
--     },
--   },
-- })

local builtin = require('telescope.builtin')
local telescope = require('telescope')
local my_telescope = require('plugins.my_telescope')  -- Asegúrate de que el archivo existe

-- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Asigna la combinación de teclas <leader>t al comando de Telescope para hacer búsqueda de texto en vivo (grep)
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope live_grep<CR>', { noremap = true, silent = true })

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
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
  },
})

-- Asigna la combinación de teclas <leader>sr a la nueva función de buscar y reemplazar
vim.api.nvim_set_keymap('n', '<leader>er', '<cmd>lua require("plugins.my_telescope").search_and_replace()<CR>', { noremap = true, silent = true })

 -- Asigna la combinación de teclas <leader>sg a la nueva función de buscar y reemplazar globalmente
vim.api.nvim_set_keymap('n', '<leader>eg', '<cmd>lua require("plugins.my_telescope").search_and_replace_global()<CR>', { noremap = true, silent = true })
