-- init.lua
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Archivos requeridos
require('settings')
require('keymaps')
require('plugins/packer')
--require('plugins/tokyodark')
require('plugins/iceberg')
-- Barra inferior
require('plugins/feline')
-- Ortografia
require('plugins/vimPoliglot')
require('plugins/vimtex')
-- Visor
require('plugins/tree')
require('plugins/nvim-web-devicons')
require('plugins/telescope')
require('plugins/markdownPreview')
--require('plugins/harpoon')
-- Autocompletado
require('autocompletado')
-- LPS y Mason
require('plugins/mason')
-- LuaSnip
require('plugins/luasnip')
-- Ruta a tu carpeta de snippets 
local snippet_paths = vim.fn.stdpath("config") .. "/luasnippets/"
-- Cargar todos los archivos de snippets en la carpeta 
require("luasnip.loaders.from_lua").load({ paths = snippet_paths})
-- Comentarios 
require('plugins/comment')
require('templates')
-- Lo copiado o cortado en Neovim aparecerá en el clipboard externo
vim.o.clipboard = "unnamedplus"
