-- Treesitter enhances the code editing experience by providing advanced syntax highlighting, incremental parsing, and improved code navigation. It supports multiple programming languages and allows for precise code refactoring and manipulation using Abstract Syntax Trees (AST).
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "lua", "python", "javascript", "html", "css" }, -- Añade los lenguajes que necesites
  highlight = {
    enable = true, -- Habilitar resaltado de sintaxis
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

