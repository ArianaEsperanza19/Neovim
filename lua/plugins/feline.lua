-- Feline is a highly configurable and customizable statusline plugin for Neovim. It allows you to create a statusline that perfectly fits your needs and preferences, displaying useful information at a glance. Feline enhances your productivity by providing an informative and visually appealing statusline that can be tailored to show exactly what you want.

local feline = require('feline')

-- Obtener los colores del esquema de colores actual
local colors = {
  bg = vim.fn.synIDattr(vim.fn.hlID('StatusLine'), 'bg'),
  fg = vim.fn.synIDattr(vim.fn.hlID('StatusLine'), 'fg'),
  yellow = vim.fn.synIDattr(vim.fn.hlID('WarningMsg'), 'fg'),
  cyan = vim.fn.synIDattr(vim.fn.hlID('Type'), 'fg'),
  darkblue = vim.fn.synIDattr(vim.fn.hlID('Identifier'), 'fg'),
  green = vim.fn.synIDattr(vim.fn.hlID('String'), 'fg'),
  orange = vim.fn.synIDattr(vim.fn.hlID('Constant'), 'fg'),
  violet = vim.fn.synIDattr(vim.fn.hlID('Function'), 'fg'),
  magenta = vim.fn.synIDattr(vim.fn.hlID('Statement'), 'fg'),
  blue = vim.fn.synIDattr(vim.fn.hlID('Keyword'), 'fg'),
  red = vim.fn.synIDattr(vim.fn.hlID('ErrorMsg'), 'fg'),
}

local function spell_lang()
  return vim.o.spelllang
end

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}}
}

-- Tipo de archivo
table.insert(components.active[1], {
  provider = 'file_type',
  hl = {
    fg = colors.cyan,
    style = 'bold'
  },
  right_sep = ' ',
  left_sep = ' '
})

-- Cotejamiento
table.insert(components.active[1], {
  provider = 'file_encoding',
  hl = {
    fg = colors.red,
    style = 'bold'
  },
  right_sep = ' '
})

-- Directorio completo del archivo
table.insert(components.active[1], {
  provider = function()
    return vim.fn.expand('%:p:h')
  end,
  hl = {
    fg = colors.cyan,
    style = 'bold'
  },
  right_sep = ' '
})

-- Titulo de archivo
table.insert(components.active[1], {
  provider = function()
    return vim.fn.expand('%:t:r')
  end,
  hl = {
    fg = colors.red,
    style = 'bold'
  },
  right_sep = ' '
})

-- Errores de compilación u ortografía
table.insert(components.active[1], {
  provider = 'diagnostic_errors',
  hl = {
    fg = colors.red,
    style = 'bold'
  },
  right_sep = ' '
})

-- Advertencias
table.insert(components.active[1], {
  provider = 'diagnostic_warnings',
  hl = {
    fg = colors.yellow,
    style = 'bold'
  },
  right_sep = ' '
})

-- Número de palabras
table.insert(components.active[3], {
  provider = function()
    local wc = vim.fn.wordcount()
    return tostring(wc.words) .. ' words'
  end,
  hl = {
    fg = colors.cyan,
    style = 'bold'
  },
  right_sep = ' '
})

-- Porcentaje del documento recorrido
table.insert(components.active[3], {
  provider = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local percentage = math.floor((current_line / total_lines) * 100)
    return tostring(percentage) .. '%%'
  end,
  hl = {
    fg = colors.red,
    style = 'bold'
  },
  right_sep = ' '
})

-- Línea del cursor
table.insert(components.active[3], {
  provider = 'position',
  hl = {
    fg = colors.cyan,
    style = 'bold'
  },
  right_sep = ' '
})

-- Diccionario
table.insert(components.active[3], {
  provider = spell_lang,
  enabled = function()
    return vim.o.spell
  end,
  icon = '暈 ',  -- Puedes cambiar el icono si lo deseas
  hl = {
    fg = colors.red,
    style = 'bold'
  },
  right_sep = ' '
})

-- Configuración de Feline
feline.setup({
  components = components,
  colors = {
    bg = colors.bg,
    fg = colors.fg,
  },
})

