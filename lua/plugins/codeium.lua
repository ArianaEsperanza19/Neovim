-- Codeium is an AI-powered autocompletion plugin for Neovim that enhances coding efficiency by providing intelligent and contextual code suggestions. It helps developers write code faster and more accurately by understanding the context and suggesting completions based on common patterns and best practices.

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

-- Usar <Tab> normalmente si no hay sugerencia de Codeium activa
vim.api.nvim_set_keymap('i', '<Tab>', '<Nop>', { noremap = true, silent = true })

-- Asignar <F3> para aceptar las sugerencias de Codeium
vim.api.nvim_set_keymap('i', '<F1><F1>', 'codeium#Accept()', { noremap = true, silent = true, expr = true })

-- Abrir y cerrar el chat de Codeium con F4
vim.api.nvim_set_keymap('n', '<F3>', ':Codeium Chat<CR>', { noremap = true, silent = true })
