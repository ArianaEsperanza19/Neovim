-- ~/.config/nvim/lua/neotree.lua

-- Habilitar colores de terminal en Neovim
vim.opt.termguicolors = true

-- Función my_on_attach para nvim-tree
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Mapeos predeterminados
  api.config.mappings.default_on_attach(bufnr)

  -- Mapeos personalizados
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- Configurar nvim-web-devicons
require('nvim-web-devicons').setup {
  default = true,
}

-- Configurar Neotree para usar nvim-web-devicons
require('nvim-tree').setup {
  on_attach = my_on_attach,
  renderer = {
    icons = {
      glyphs = {
        default = '',  -- Icono predeterminado para archivos
        symlink = '',  -- Icono de enlace simbólico
        git = {
          unstaged = "✗",      -- No preparado
          staged = "✓",        -- Preparado
          unmerged = '',      -- No fusionado
          renamed = "➜",       -- Renombrado
          untracked = "★",     -- No rastreado
          deleted = "",      -- Eliminado
          ignored = "◌",       -- Ignorado
        },
        folder = {
          default = "",      -- Carpeta predeterminada
          open = "",         -- Carpeta abierta
          empty = "",        -- Carpeta vacía
          empty_open = "",   -- Carpeta vacía abierta
          symlink = "",      -- Carpeta enlace simbólico
          symlink_open = "", -- Carpeta enlace simbólico abierta
        },
      },
    },
  },
  view = {
    width = 30,
    side = 'left',
    -- auto_close = true,
  },
}

-- Mapeo para abrir y cerrar Neotree con <leader>m
vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

