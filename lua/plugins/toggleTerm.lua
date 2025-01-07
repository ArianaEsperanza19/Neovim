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

-- Mapeo para abrir y cerrar toggleTerm con Control + \
vim.api.nvim_set_keymap('n', '<C-\\>', ':ToggleTerm<CR>', { noremap = true, silent = true })
