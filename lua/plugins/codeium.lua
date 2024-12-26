-- ~/.config/nvim/init.lua

-- Función para aceptar sugerencia de Codeium o pasar la acción de Tab
function _G.check_codeium_and_tab()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return t('<Tab>')
  else
    return vim.fn['codeium#Accept']()
  end
end

-- Helper function to translate key
function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Asignar <F3> para aceptar las sugerencias de Codeium
vim.api.nvim_set_keymap('i', '<F3>', 'codeium#Accept()', { noremap = true, silent = true, expr = true })

-- Usar <Tab> normalmente si no hay sugerencia de Codeium activa
vim.api.nvim_set_keymap('i', '<Tab>', '<Nop>', { noremap = true, silent = true })

-- Abrir y cerrar el chat de Codeium con F4 
vim.api.nvim_set_keymap('n', '<F4>', ':Codeium Chat<CR>', { noremap = true, silent = true })
