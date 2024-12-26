local cmd = vim.cmd
local opt = vim.opt
opt.termguicolors = true

require('tokyodark').setup({
  mirage = false, -- Usar un esquema de colores más oscuro
  gamma = 0.8, -- Ajustar el brillo del tema a un valor más oscuro
  transparent_background = false, -- Desactivar el fondo transparente para mayor oscuridad
  styles = {
    comments = { italic = true }, -- estilo para comentarios
    keywords = { italic = true, bold = true, fg = "#FF79C6" }, -- estilo para palabras clave, color magenta neon
    identifiers = { italic = true }, -- estilo para identificadores
    functions = { bold = true, fg = "#8BE9FD" }, -- estilo para funciones, color azul neon
    variables = { fg = "#BD93F9" }, -- estilo para variables, color morado neon
  },
  custom_highlights = function(highlights, palette)
    -- Personalizar más elementos con colores azulados y magenta
    highlights.Normal = { bg = "#000000", fg = "#F8F8F2" } -- Fondo negro y texto color blanco
    highlights.CursorLine = { bg = "#1E1E1E" } -- Línea del cursor más oscura
    highlights.StatusLine = { fg = "#F8F8F2", bg = "#282A36" } -- Línea de estado con color de fondo más oscuro
    return highlights
  end,
  custom_palette = function(palette)
    palette.bg = "#000000" -- Color de fondo negro
    palette.fg = "#F8F8F2" -- Color de texto blanco
    palette.red = "#FF5555" -- Color rojo neon
    palette.green = "#50FA7B" -- Color verde neon (reducido, pero aún presente para equilibrio)
    palette.yellow = "#F1FA8C" -- Color amarillo neon
    palette.blue = "#8BE9FD" -- Color azul neon principal
    palette.purple = "#BD93F9" -- Color morado neon principal
    palette.cyan = "#8BE9FD" -- Color cian neon
    palette.white = "#F8F8F2" -- Color blanco
    return palette
  end,
  terminal_colors = true, -- habilitar colores de terminal
})

cmd("colorscheme tokyodark") -- Aplicar el esquema de colores Tokyodark

