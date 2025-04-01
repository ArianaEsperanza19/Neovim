-- Import Lua modules
-----------------------------------------------------------
-- init.lua -----------
vim.opt.termguicolors = true
----------------------------------------------------------
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "<A-.>", "<Esc>") -- Remapeo de esc a alt + .
require("settings")
require("keymaps")
vim.o.clipboard = "unnamedplus"
-- Ocultar la barra de estado
vim.opt.showmode = false
-- Inicializar Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Usa la rama estable
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Cargar Lazy.nvim
require("lazy").setup({
	-- Temas
	require("plugins.temas.tokyonight"), -- require("plugins.temas.catppuccin"),
	-- require("plugins.temas.gruvbox"),
	-- require("plugins.temas.dracula"),
	-- -- Git -------------
	require("plugins.gitsigns"),
	require("plugins.git-fugitive"),
	-- Barra ----------------
	require("plugins.lualine"),
	require("plugins.bufferLine"),
	-- -- Terminal -----------
	require("plugins.toggleTerm"),
	require("plugins.snacks"),
	require("plugins.noice"),
	-- Ortografia ----------
	require("plugins.vimPoliglot"),
	require("plugins.vimtex"),
	require("plugins.dict"),
	-- Resaltador
	require("plugins.treesitter"),
	require("plugins.neotree"),
	require("plugins.alphaNvim"),
	require("plugins.telescope"),
	require("plugins.aerial"),
	require("plugins.leap"),
	-- Markdown ------------
	require("plugins.peek"),
	-- Autocompletado ------
	require("plugins.lsp"),
	require("plugins.lspzero"),
	require("plugins.nvim-cmp"),
	require("plugins.luasnip"),
	-- LPS y Mason ---------
	require("plugins.mason"),
	require("plugins.noneLS"),
	-- Comentarios ---------
	require("plugins.comment"),
	require("plugins.todoComment"),
	-- -- Marcar de etiquetas
	-- require("plugins.jumpTag")
	-- -- DB -----------------
	require("plugins.dadbod"),
	-- -- Errores ------------- fallos en su implementacion
	require("plugins.trouble"),
	require("plugins.dap"),
	-- -- IA ------------------
	require("plugins.codeium"),
	require("plugins.avante"),
	-- -- Calidad de vida ----
	require("plugins.nvim-surround"),
	"windwp/nvim-autopairs",
	"mbbill/undotree",
	require("plugins.neoclip"),
	require("plugins.ctrlsf"),
	{ "simeji/winresizer" },
	-- -- Otros ---------------
	-- require("plugins.obsidian")
}, {
	-- Opciones globales para Lazy.nvim
	defaults = { lazy = false },
})
require("plugins.undotree")
require("plugins.autopairs")
--------------------------
require("autocompletado")
require("templates")
-- Atajos ------------
require("atajos.atajos")
