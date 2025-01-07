-- <leader>
vim.g.mapleader = " "
-- Desmarcar busqueda
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- Asignar un atajo para pegar el contenido del portapapeles sustituyendo la selección actual
vim.api.nvim_set_keymap('v', '<C-v>', '"_dP', { noremap = true, silent = true })

-- Asignar Control+S para guardar el archivo actual
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })
-- Guardar y salir
vim.api.nvim_set_keymap('n', '<leader><ESC>', ':x<CR>', { noremap = true, silent = true })
-- Salir sin guardar
vim.api.nvim_set_keymap('n', 'z<ESC>', ':q<CR>', { noremap = true, silent = true })
-- Asignar <leader>left para ir al principio de la línea
vim.api.nvim_set_keymap('n', '<leader><left>', '^', { noremap = true, silent = true })

-- Asignar <leader>right para ir al final de la línea
vim.api.nvim_set_keymap('n', '<leader><right>', '$', { noremap = true, silent = true })


-- Deshabilitar tabulación de Alt+i
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
-- Mapeo para Control + / para insertar '¿'
vim.api.nvim_set_keymap('i', '<F1>/', '¿', { noremap = true, silent = true })

-- Asegurarnos de que los atajos nativos con d solo borren
vim.api.nvim_set_keymap('v', 'd', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dw', 'dw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'daw', 'daw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dip', 'dip', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dib', 'dib', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dab', 'dab', { noremap = true, silent = true })

-- Mapeo para borrar el contenido del portapapeles con <leader>bp
vim.api.nvim_set_keymap('n', '<leader>bp', ':let @*="" | let @+="" | let @=""<CR>', { noremap = true, silent = true })


-- Crear una nueva línea debajo de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })
-- Crear una nueva línea encima de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true })
-- Mover línea o selección hacia arriba con `m+Up`
vim.api.nvim_set_keymap('n', 'm<Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'm<Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Mover línea o selección hacia abajo con `m+Down`
vim.api.nvim_set_keymap('n', 'm<Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'm<Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Remapear <leader>j para moverse visualmente hacia abajo una línea
vim.api.nvim_set_keymap('n', '<leader>j', 'gj', { noremap = true, silent = true })
-- Remapear <leader>k para moverse visualmente hacia arriba una línea
vim.api.nvim_set_keymap('n', '<leader>k', 'gk', { noremap = true, silent = true })

-- Aliases
local map = vim.api.nvim_set_keymap
local default_opt = {noremap = true, silent = true}

-- Bloquear flechas fuera del modo insertar
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- Función para abrir o cerrar la terminal
-- function ToggleTerminal()
--   local term_buf = vim.fn.bufnr('term://*')
--   if term_buf ~= -1 then
--     -- Si la terminal está abierta, ciérrala
--     vim.api.nvim_buf_delete(term_buf, { force = true })
--   else
--     -- Si la terminal no está abierta, ábrela
--     vim.cmd('split | terminal')
--   end
-- end

-- Mapeo de teclas para Ctrl-\ para abrir o cerrar la terminal
vim.api.nvim_set_keymap('n', '<C-\\>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-\\>', '<C-\\><C-n>:lua ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Moverse en el buffer
-- Cambiar al siguiente buffer con z + flecha derecha
vim.api.nvim_set_keymap('n', 'z<right>', ':bnext<CR>', { noremap = true, silent = true })
-- Cambiar al buffer anterior con z + flecha izquierda
vim.api.nvim_set_keymap('n', 'z<left>', ':bprevious<CR>', { noremap = true, silent = true })
-- Mapeo para cerrar el buffer actualmente abierto
vim.api.nvim_set_keymap('n', 'z<down>', ':bd<CR>', { noremap = true, silent = true })
-- Mapeo para cerrar el buffer actualmente abierto sin guardar cambios
vim.api.nvim_set_keymap('n', 'zx<down>', ':bd!<CR>', { noremap = true, silent = true })
-- Remapeo para seleccionar palabra
-- vim.api.nvim_set_keymap("n", '.vw', '.vaw', {noremap = true, silent = true })
