-- ~/.config/nvim/lua/plugins/trouble.lua
local trouble = require("trouble")

trouble.setup {
  icons = { -- Configuración de los íconos
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = ""
  },
  fold_open = "v", -- icono para plegar abierto
  fold_closed = ">", -- icono para plegar cerrado
  action_keys = { -- asignaciones para keybindings
    close = "q", -- cierra la ventana de trouble
    cancel = "<esc>", -- cancela la vista previa y cierra la lista de elementos
    refresh = "r", -- refresca la lista de elementos
    jump = {"<cr>", "<tab>"}, -- ir al item
    open_split = { "<c-x>" }, -- abrir en horizontal
    open_vsplit = { "<c-v>" }, -- abrir en vertical
    open_tab = { "<c-t>" }, -- abrir en una nueva pestaña
    jump_close = {"o"}, -- ir al item y cerrar la ventana
    toggle_mode = "m", -- cambia entre "document" y "workspace"
    toggle_preview = "P", -- mostrar vista previa del item
    hover = "K", -- mostrar información hover
    preview = "p", -- preview del item
    close_folds = {"zM", "zm"}, -- cerrar todos los plegados
    open_folds = {"zR", "zr"}, -- abrir todos los plegados
    toggle_fold = {"zA", "za"}, -- alternar entre abrir y cerrar el plegado
    previous = "k", -- ir al item anterior
    next = "j" -- ir al siguiente item
  },
  indent_lines = true, -- mostrar líneas de sangría
  auto_open = false, -- abrir Trouble automáticamente cuando hay diagnósticos
  auto_close = false, -- cerrar Trouble automáticamente cuando no hay diagnósticos
  auto_preview = false, -- previsualizar automáticamente el item
  auto_fold = false, -- plegar automáticamente la lista de items
  signs = {
    -- iconos de diagnóstico
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = ""
  },
  use_diagnostic_signs = false, -- Usar signos de diagnóstico de LSP si están disponibles
  treesitter = false,
}

-- Configuración de colores para resaltar errores en rojo
vim.cmd [[
  highlight TroubleError guifg=#FF0000
]]

