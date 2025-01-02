-- init.lua ------------
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Archivos requeridos -
require('settings')
require('keymaps')
vim.api.nvim_create_user_command('KeymapsEdicion', function()
  require('atajos/atajos_edicion').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapsNavegacion', function()
  require('atajos/atajos_navegacion').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapsOrtografia', function()
  require('atajos/atajos_ortografia').show_spell_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapsLS', function()
  require('atajos/atajos_letras_simbolos').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapscHtml', function()
  require('atajos/atajos_html').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapscTex', function()
  require('atajos/atajos_Tex').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapscMd', function()
  require('atajos/atajos_Md').show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command('KeymapsOtros', function()
  require('atajos/atajos_otros').show_keymaps()
end, { nargs = 0 })

--require('plugins/bootstrap')
require('plugins/packer')
--require('plugins/tokyodark')
require('plugins/iceberg')
-- Barra inferior ------
require('plugins/feline')
-- Ortografia ----------
require('plugins/vimPoliglot')
require('plugins/vimtex')
-- Visor ---------------
require('plugins/treesitter')
require('plugins/tree')
require('plugins/nvim-web-devicons')
require('plugins/bufferLine')
require('plugins/telescope')
-- require('plugins/markdownPreview')
require('plugins/peek')
--require('plugins/harpoon')
-- Autocompletado ------
require('autocompletado')
-- LuaSnip -------------
require('plugins/luasnip')
-- Ruta a tu carpeta de snippets
local snippet_paths = vim.fn.stdpath("config") .. "/luasnippets/"
-- Cargar todos los archivos de snippets en la carpeta
require("luasnip.loaders.from_lua").load({ paths = snippet_paths})
-- LPS y Mason ---------
require('plugins/mason')
require('plugins/nullLS')
-- Comentarios ---------
require('plugins/comment')
require('templates')
-- Marcar de etiquetas
require('plugins/jumpTag')
-- Errores ------------- fallos en su implementacion
-- require('plugins/trouble')
-- Lo copiado o cortado en Neovim aparecerá en el clipboard externo
vim.o.clipboard = "unnamedplus"
-- IA ------------------
require('plugins/codeium')
