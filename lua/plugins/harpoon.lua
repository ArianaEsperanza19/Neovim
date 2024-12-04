-- Configura harpoon con la configuración predeterminada
local harpoon = require('harpoon').setup({})
--local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

-- Mapeos de teclas para harpoon

-- Añade el archivo actual a la lista de Harpoon
vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
-- Elimina el archivo actual de la lista de Harpoon 
vim.keymap.set('n', '<leader>d', function() harpoon_mark.rm_file() end)

-- Abre el menú rápido de Harpoon
-- Keybinding para abrir el menú de marcas con Shift + ` 
vim.api.nvim_set_keymap('n', '<leader>`', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
-- Selecciona el primer archivo en la lista de Harpoon
vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)

-- Selecciona el segundo archivo en la lista de Harpoon
vim.keymap.set('n', '<C-j>', function() harpoon:list():select(2) end)

-- Selecciona el tercer archivo en la lista de Harpoon
vim.keymap.set('n', '<C-k>', function() harpoon:list():select(3) end)

-- Selecciona el cuarto archivo en la lista de Harpoon
vim.keymap.set('n', '<C-l>', function() harpoon:list():select(4) end)

-- Alterna al buffer anterior en la lista de Harpoon
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)

-- Alterna al siguiente buffer en la lista de Harpoon
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

