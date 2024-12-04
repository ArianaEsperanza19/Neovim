local feline = require('feline')

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
        fg = 'skyblue',
        style = 'bold'
    },
    right_sep = ' ',
    left_sep = ' '
})
-- Cotejamiento
table.insert(components.active[1], {
    provider = 'file_encoding',
    hl = {
        fg = '#ff2d62',
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
        fg = 'skyblue',
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
           fg = '#ff2d62',
           style = 'bold'
        },
  right_sep = ' '
})


-- Errores de compilación u ortografía
table.insert(components.active[1], {
    provider = 'diagnostic_errors',
    hl = {
        fg = 'red',
        style = 'bold'
    },
    right_sep = ' '
})

-- Advertencias
table.insert(components.active[1], {
    provider = 'diagnostic_warnings',
    hl = {
        fg = 'yellow',
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
        fg = 'skyblue',
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
        fg = '#ff2d62',
        style = 'bold'
    },
    right_sep = ' '
})


-- Línea del cursor
table.insert(components.active[3], {
    provider = 'position',
    hl = {
        fg = 'skyblue',
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
          icon = '暈',  -- Puedes cambiar el icono si lo deseas
          hl = {
            fg = '#ff2d62',
            style = 'bold'
          },
    right_sep = ' '
})

feline.setup({
    components = components
})

