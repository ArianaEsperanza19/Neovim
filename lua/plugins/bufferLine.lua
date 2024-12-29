-- Bufferline provides a visual tab bar for open buffers in Neovim, allowing for easier and more intuitive management of multiple buffers. It helps to quickly navigate between open files and visually track which files are currently open, enhancing productivity and workflow.
require('bufferline').setup {
  options = {
    numbers = "ordinal",  -- Mostrar números ordinales
    show_buffer_icons = true,  -- Mostrar iconos de archivos
    show_buffer_close_icons = true,  -- Mostrar iconos para cerrar buffers
    separator_style = "thick",  -- Estilo de separadores ("slant", "thick", "thin", etc.)
    diagnostics = "nvim_lsp",  -- Mostrar diagnósticos de LSP
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  },
  highlights = {
    fill = {
      guifg = '#ffffff',  -- Color blanco para el texto
      guibg = '#485075'  -- Fondo gris más claro para la barra
    },
    background = {
      guifg = 'skyblue',  -- Color del texto en las pestañas no seleccionadas
      guibg = '#3b4252'  -- Fondo gris más claro para pestañas no seleccionadas
    },
    buffer_visible = {
      guifg = 'skyblue',  -- Color del texto para buffers visibles
      guibg = '#3b4252',
    },
    buffer_selected = {
      guifg = '#ff2d62',  -- Color coincidente con Feline para pestañas seleccionadas
      guibg = '#434c5e',  -- Fondo gris claro para la pestaña seleccionada
      gui = "bold"
    },
    separator = {
      guifg = '#4c566a',  -- Color del separador más claro para distinguir de las pestañas
      guibg = '#485075'  -- Fondo gris claro para que contraste con el área de texto
    },
    separator_selected = {
      guifg = '#4c566a',
      guibg = '#2e3440'
    },
    separator_visible = {
      guifg = '#4c566a',
      guibg = '#2e3440'
    },
    indicator_selected = {
      guifg = '#4c566a',
      guibg = '#2e3440'
    },
    modified = {
      guifg = '#ff2d62',  -- Color para indicar buffers modificados
      guibg = '#3b4252',
    },
    modified_visible = {
      guifg = '#ff2d62',
      guibg = '#3b4252'
    },
    modified_selected = {
      guifg = '#ff2d62',
      guibg = '#434c5e'
    },
  }
}
