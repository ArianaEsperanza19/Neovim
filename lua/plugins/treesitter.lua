-- Treesitter enhances the code editing experience by providing advanced syntax highlighting, incremental parsing, and improved code navigation. It supports multiple programming languages and allows for precise code refactoring and manipulation using Abstract Syntax Trees (AST).
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "lua", "python", "javascript", "html", "css", "markdown", "c", "php" }, -- Añade los lenguajes que necesites
  highlight = {
    enable = true, -- Habilitar resaltado de sintaxis
    additional_vim_regex_highlighting = false, -- Desactivar resaltado regex adicional para evitar conflictos
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- Iniciar la selección incremental
      node_incremental = "grn", -- Seleccionar el siguiente nodo
      scope_incremental = "grc", -- Seleccionar el siguiente ámbito
      node_decremental = "grm", -- Selección decreciente de nodo
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer", -- Seleccionar todo el bloque de una función
        ["if"] = "@function.inner", -- Seleccionar el interior de una función
        ["ac"] = "@class.outer", -- Seleccionar toda la clase
        ["ic"] = "@class.inner", -- Seleccionar el interior de una clase
      },
    },
  },
}
-- Requerir configuración de Trouble.nvim 
require('trouble')

-- Asignar keybindings para Trouble.nvim
vim.api.nvim_set_keymap("n", "<C-c>", "<cmd>Trouble close<cr>", {silent = true, noremap = true}) -- Tecla para cerrar Trouble.nvim
