-- Import Lua modules
-----------------------------------------------------------
-- init.lua -----------
vim.opt.termguicolors = true
----------------------------------------------------------
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "<C-m>", "<Esc>") -- Remapeo de esc a control + m
-- Archivos requeridos-
require("plugins.packer")
--require("./lazy")
require("settings")
require("keymaps")
-- Temas
-- require("plugins.temas.iceberg")
-- require("plugins.temas.catppucin")
require("plugins.temas.tokyoNight")
---------------------------------------
-- Barra inferior ------
require("plugins.feline")
-- Buffer --------------
require("plugins.bufferLine")
-- Visor ---------------
require("plugins.treesitter")
require("plugins.neotree")
require("plugins.alphaNvim")
require("plugins.nvim-web-devicons")
require("plugins.telescope")
require("plugins.aerial")
require("plugins.leap")
-- Ortografia ----------
require("plugins.vimPoliglot")
require("plugins.vimtex")
require("plugins.dict")
-- Markdown ------------
require("plugins.peek")
--require('plugins.harpoon')
-- Autocompletado ------
require("autocompletado")
-- LuaSnip -------------
require("plugins.luasnip")
-- LPS y Mason ---------
require("plugins.mason")
require("plugins.noneLS")
-- Comentarios ---------
require("plugins.comment")
require("templates")
-- Marcar de etiquetas
require("plugins.jumpTag")
-- Errores ------------- fallos en su implementacion
require("plugins.trouble")
require("plugins.dap")
-- IA ------------------
require("plugins.codeium")
-- Git -------------
require("plugins.gitsigns")
require("plugins.git-fugitive")
-- Terminal -----------
require("plugins.toggleTerm")
require("plugins.snacks")
require("plugins.noice")
-- DB -----------------
require("plugins.dadbod")
-- Calidad de vida ----
require("plugins.nvim-surround")
require("plugins.undotree")
require("plugins.neoclip")
require("plugins.ctrlsf")
require("plugins.winresizer")
-- Otros ---------------
require("plugins.obsidian")
-- Lo copiado o cortado en Neovim aparecerá en el clipboard externo
vim.o.clipboard = "unnamedplus"
-- Ocultar la barra de estado
vim.opt.showmode = false
-- Atajos ------------
require("atajos.atajos")
