-- vim-polyglot is a plugin for Vim that provides syntax and configuration support for a wide variety of programming languages and file formats. It is a "language pack" that includes support for over 120 languages, making it very useful for developers working with multiple languages in a single environment.
-- Se aplicara la correcion a los archivos md, tex y txt
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"markdown", "tex", "text"},
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'es'
  end
})

function ChangeSpellLang(lang)
  vim.opt_local.spelllang = lang
end

-- Comandos personalizados para cambiar el idioma de corrección ortográfica
vim.api.nvim_create_user_command('SpellLangEn', function() ChangeSpellLang("en") end, {})
vim.api.nvim_create_user_command('SpellLangEs', function() ChangeSpellLang("es") end, {})
vim.api.nvim_create_user_command('SpellLangEo', function()
  vim.opt.spell = true
  vim.opt.spelllang = 'eo'
  print("Corrección ortográfica en esperanto activada")
end, {})

-- Crear un comando para desactivar la corrección ortográfica
vim.api.nvim_create_user_command('DisableSpell', function()
  vim.opt.spell = false
  print("Corrección ortográfica desactivada")
end, {})


-- Para ver las sugerencias de las palabras mal escritas -> z= sobre la palabra en cuestion
-- Para agregar palabra al diccionario -> zg sobre la palabra

-- Atajos para Esperanto
-- Mover al siguiente error ortográfico
vim.api.nvim_set_keymap('n', 'ĵs', '[s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ĥs', ']s', { noremap = true, silent = true })

-- Eliminar o cortar
vim.api.nvim_set_keymap('n', 'ĝ', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Ĝ', 'W', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Ĝ', 'W', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'diĝ', 'diw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'daĝ', 'daw', { noremap = true, silent = true })

-- Copiar
vim.api.nvim_set_keymap('n', 'ŭ', 'y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭŭ', 'yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭnŭ', 'yny', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭĝ', 'yw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭip', 'yip', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭib', 'yib', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭap', 'yap', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭab', 'yab', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭaĝ', 'yaw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŭiĝ', 'yiw', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'ĉ', 'x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Ĉ', 'X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ŝ', 'q', { noremap = true, silent = true })
-- ŝĝĉŭĥĵ
