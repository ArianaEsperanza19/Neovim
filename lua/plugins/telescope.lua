-- Telescope is a powerful search plugin for Neovim that provides a highly extensible and configurable command-line interface for searching files, text, and more. It uses a popup-based interface to display search results clearly and efficiently, greatly enhancing developer productivity.

local builtin = require('telescope.builtin')
local telescope = require('telescope')
local my_telescope = require('plugins.my_telescope')  -- Asegúrate de que el archivo existe

-- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Asigna la combinación de teclas <leader>t al comando de Telescope para hacer búsqueda de texto en vivo (grep)
vim.api.nvim_set_keymap('n', '<leader>tt', ':Telescope live_grep<CR>', { noremap = true, silent = true })

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
  extensions = {
    bookmarks = {
      sources = {
        {"bookmarks", "Bookmarks"},
      },
      mappings = {
        i = {
          ["ma"] = actions.select_default,
        },
      },
    },
  },
})

-- Asigna la busqueda local de terminos para reemplazarlos
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>lua require("plugins.my_telescope").Search_and_replace()<CR>', { noremap = true, silent = true })

-- Asigna la busqueda global de terminos para reemplazarlos
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua require("plugins.my_telescope").Search_and_replace_global()<CR>', { noremap = true, silent = true })

-- Asigna la busqueda local para buscar y remplazarlos selectivamente
vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>lua require("plugins.my_telescope").Search_and_replace_in_current_file()<CR>', { noremap = true, silent = true })

-- Asigna la combinación de teclas ma al comando de Telescope para mostrar las marcas
vim.keymap.set('n', 'ma', '<cmd>Telescope vim_bookmarks<CR>', { desc = 'Telescope bookmarks' })
