require('gitsigns').setup {
  -- ... (resto de la configuración)

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Navegar a través de los hunks
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, 'Ir al siguiente hunk')

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, 'Ir al hunk anterior')

    -- Ver el preview del hunk
    map('n', '<leader><F4>', ':Gitsigns preview_hunk<CR>', 'Ver preview del hunk')
    -- Habilitar/Desabilitar ver el blame del hunk actual
    map('n', '<F4>', ':Gitsigns toggle_current_line_blame<CR>', 'Ver blame del hunk')

  end,
}
