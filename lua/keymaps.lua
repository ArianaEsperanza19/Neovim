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

-- Mapeo para cortar (delete y yank) la selección en modo visual con dy
vim.api.nvim_set_keymap('v', 'dy', '"*d', { noremap = true, silent = true })
-- Mapeo para cortar (delete y yank) una línea completa con dyy
vim.api.nvim_set_keymap('n', 'dyy', '"*dd', { noremap = true, silent = true })


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
