-- toggleTerm: un plugin de Neovim que permite abrir y cerrar un terminal flotante en la ventana actual.
-- Permite ejecutar comandos y programas en un entorno de terminal dentro de Neovim,
-- sin necesidad de salir de la aplicación.
--
-- toggleTerm se puede abrir y cerrar utilizando una combinación de teclas personalizable,
-- y se puede configurar para que aparezca en diferentes posiciones y tamaños en la ventana.
-- También se pueden agregar estilos y personalizaciones adicionales para mejorar la apariencia del terminal.
--
-- Algunas de las características clave de toggleTerm incluyen:
--  * Abrir y cerrar el terminal flotante con una combinación de teclas personalizable.
--  * Configurar el tamaño y la posición del terminal flotante en la ventana.
--  * Agregar estilos y personalizaciones adicionales para mejorar la apariencia del terminal.
--  * Ejecutar comandos y programas en un entorno de terminal dentro de Neovim.
require('toggleterm').setup {
  -- Configuración de toggleTerm
  direction = 'float',  -- Configura el terminal flotante para que aparezca en el centro de la pantalla
  float_opts = {
    border = 'single',  -- Agrega un borde sencillo alrededor del terminal flotante
    winblend = 10,  -- Ajusta la transparencia del terminal flotante
    highlights = {
      border = 'FloatBorder',  -- Agrega un color de borde al terminal flotante
      background = 'FloatBackground',  -- Agrega un color de fondo al terminal flotante
    },
  },
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = true,
  -- Otras opciones de configuración...
}

-- Define la función para ejecutar el archivo actual con detección de archivos .c
function run_current_file()
  local file_path = vim.api.nvim_buf_get_name(0)

  -- Detecta la extensión del archivo
  local file_extension = file_path:match("^.+(%..+)$")

  local cmd
  if file_extension == ".c" then
    -- Si es un archivo .c, compilar y ejecutar
    local file_name = vim.fn.fnamemodify(file_path, ':r')
    cmd = string.format("gcc %s -o %s && %s", file_path, file_name, file_name)
   elseif file_extension == ".php" then
     -- Si es un archivo .php, ejecutarlo con el intérprete de php
      cmd = string.format("chmod 755 %s", file_path)
      cmd = string.format("php %s", file_path)
  else
    -- Para otros tipos de archivos, simplemente ejecutarlos
    cmd = string.format('chmod 755 %s', file_path)
    -- Bash .sh
    if(file_extension == '.sh') then
    cmd = string.format('bash %s', file_path)
    end -- if Bash
  end

  local Terminal = require('toggleterm.terminal').Terminal
  local run_file = Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false,
    on_open = function(term)
      vim.cmd("startinsert!")
      -- Puedes agregar más configuraciones aquí si lo deseas
    end,
  })
  run_file:toggle()
end

-- Mapeo para abrir y cerrar toggleTerm con Control + \
vim.api.nvim_set_keymap('n', '<C-\\>', ':ToggleTerm<CR>', { noremap = true, silent = true })

-- Mapeo para ejecutar el archivo actual con Leader + r
vim.api.nvim_set_keymap('n', '<leader>rr', ':lua run_current_file()<CR>', { noremap = true, silent = true })


local Terminal  = require('toggleterm.terminal').Terminal

-- Define una terminal dividida horizontalmente
local split_h_term = Terminal:new({
  direction = "horizontal",
  size = 20,  -- Ajusta el tamaño de la terminal dividida horizontalmente
  close_on_exit = true,
})

-- Define una terminal dividida verticalmente
local split_v_term = Terminal:new({
  direction = "vertical",
   size = vim.o.columns * 0.10, -- Ajusta el tamaño de la terminal dividida verticalmente al 50% del ancho de la pantalla
  close_on_exit = true,
})

-- Funciones para abrir las terminales
function _SPLIT_H_TERM_TOGGLE()
  split_h_term:toggle()
end

function _SPLIT_V_TERM_TOGGLE()
  split_v_term:toggle()
end

-- Configura toggleterm
require('toggleterm').setup {
  open_mapping = [[<C-\>]], -- Mantén esta configuración para la terminal predeterminada
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = true,
  -- Otras opciones de configuración...
}

-- Mapeos para abrir las diferentes terminales
vim.api.nvim_set_keymap('n', '<leader>th', ':lua _SPLIT_H_TERM_TOGGLE()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':lua _SPLIT_V_TERM_TOGGLE()<CR>', { noremap = true, silent = true })

