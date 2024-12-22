-- <leader>
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- Deshabilitar tabulacion de Alt+i 
vim.api.nvim_set_keymap('i', '<C-i>', '<Nop>', { noremap = true, silent = true })
-- La letra ñ en el teclado
vim.api.nvim_set_keymap('i', '<A-n>', 'ñ', { noremap = true, silent = true })
-- Mapas para vocales acentuadas en modo inserción
vim.api.nvim_set_keymap('i', '<A-a>', 'á', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-S-a>', 'Á', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-e>', 'é', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-S-e>', 'É', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-i>', 'í', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-S-i>', 'Í', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-o>', 'ó', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-S-o>', 'Ó', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-u>', 'ú', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-S-u>', 'Ú', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'ĕ', { noremap = true, silent = true })
-- Mapea Control + / para insertar '¿'
vim.api.nvim_set_keymap('i', '<Tab>/', '¿', { noremap = true, silent = true })

-- Mapeo para cortar (delete y yank) la selección en modo visual con dy
vim.api.nvim_set_keymap('v', 'dy', '"*d', { noremap = true, silent = true })
-- Mapeo para cortar (delete y yank) una línea completa con dyy
vim.api.nvim_set_keymap('n', 'dyy', '"*dd', { noremap = true, silent = true })
-- Mapeo para cortar (delete y yank) una palabra con diw
vim.api.nvim_set_keymap('n', 'dyw', '"*diw', { noremap = true, silent = true })
-- Mapeo para cortar un parrafo con dip
vim.api.nvim_set_keymap('n', 'dyp', '"*dip', { noremap = true, silent = true })
-- Mapeo para cortar el contenido de un parentesis con dib
vim.api.nvim_set_keymap('n', 'dyb', '"*dib', { noremap = true, silent = true })
-- Mapeo para cortar el contenido de un parentesis con dab 
vim.api.nvim_set_keymap('n', 'dyab', '"*dab', { noremap = true, silent = true })

-- Crear una nueva línea debajo de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })
-- Crear una nueva línea encima de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true })

-- Remapear <leader>j para moverse visualmente hacia abajo una línea
vim.api.nvim_set_keymap('n', '<leader>j', 'gj', { noremap = true, silent = true })
-- Remapear <leader>k para moverse visualmente hacia arriba una línea
vim.api.nvim_set_keymap('n', '<leader>k', 'gk', { noremap = true, silent = true })

-- Aliases
local map = vim.api.nvim_set_keymap
local default_opt = {noremap = true, silent = true}
local cmd = vim.cmd

--- Bloquear flechas fuera del modo insertar
map('','<up>','<nop>', {noremap = true})
map('','<down>','<nop>', {noremap = true})
map('','<left>','<nop>', {noremap = true})
map('','<right>','<nop>', {noremap = true})

-- Función para abrir o cerrar la terminal
function ToggleTerminal()
  local term_buf = vim.fn.bufnr('term://*')
  if term_buf ~= -1 then
    -- Si la terminal está abierta, ciérrala
    vim.api.nvim_buf_delete(term_buf, { force = true })
  else
    -- Si la terminal no está abierta, ábrela
    vim.cmd('split | terminal')
  end
end

-- Mapeo de teclas para Ctrl-\ para abrir o cerrar la terminal
vim.api.nvim_set_keymap('n', '<C-\\>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-\\>', '<C-\\><C-n>:lua ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Moverse en el buffer
-- Cambiar al siguiente buffer con b + flecha abajo
vim.api.nvim_set_keymap('n', '<tab><Down>', ':bnext<CR>', { noremap = true, silent = true })
-- Cambiar al buffer anterior con b + flecha arriba
vim.api.nvim_set_keymap('n', '<tab><Up>', ':bprevious<CR>', { noremap = true, silent = true })

