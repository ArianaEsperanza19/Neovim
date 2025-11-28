-- Import Lua modules
-----------------------------------------------------------
-- To instal from 0 you need:
-- Git
-- Npm
-- RipGrep
-- Devicons and nerd fonts (optional)
-- Para portapapeles externo en X11 sudo apt install xclip y para Wayland es sudo apt install wl-clipboard
-- For Rust install rustc, cargo and rustup
--
-- Instalar la herramienta de Búsqueda Ultra-Rápida (ripgrep)
-- # Es necesario para Telescope y fzf-lua.
-- sudo apt install ripgrep
--
-- # 4. Instalar el Gestor de Paquetes de Lua (LuaRocks)
-- # Necesario para ciertas dependencias de plugins de Neovim.
-- sudo apt install luarocks
--
-- # 5. [OPCIONAL] Herramientas para previsualización de imágenes en fzf-lua
-- # Instala uno o ambos para ver imágenes en la terminal
-- # sudo apt install viu chafa
-- init.lua -----------
vim.opt.termguicolors = true
----------------------------------------------------------
-- Logs
-- vim.api.nvim_exec(
-- 	[[
--   autocmd VimLeavePre * silent !echo "Neovim cerró con mensaje: " >> ~/.config/nvim/nvim_log.txt
--   autocmd VimLeavePre * silent !echo v:errmsg >> ~/.config/nvim/nvim_log.txt
-- ]],
-- 	false
-- )
-----------------------------------------------------------
-- Cambia el nombre del archivo para que sea tomado como init.lua
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "<A-z>", "<Esc>", { noremap = true })
require("settings")
require("keymaps")
vim.opt.clipboard = "unnamedplus"
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
	-- require("plugins.temas.tokyonight"),
	require("plugins.temas.catppuccin"),
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
	require("plugins.vim-chase"),
	-- require("plugins.languagetool"),
	require("plugins.vimtex"),
	require("plugins.dict"),
	-- Resaltador
	require("plugins.treesitter"),
	-- Interfaz
	require("plugins.neotree"),
	require("plugins.alphaNvim"),
	require("plugins.telescope"),
	require("plugins.which-key"),
	require("plugins.aerial"),
	-- -- Errores ------------- fallos en su implementacion
	require("plugins.trouble"),
	require("plugins.dap"),
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
	-- -- IA ------------------
	require("plugins.codeium"),
	require("plugins.dressing"),
	require("plugins.avante"),
	-- -- Calidad de vida ----
	require("plugins.leap"),
	require("plugins.nvim-surround"),
	"windwp/nvim-autopairs",
	require("plugins.autotag"),
	require("plugins.rainbow-cvs"),
	require("plugins.minty"),
	require("plugins.colorizer"),
	"mbbill/undotree",
	require("plugins.neoclip"),
	require("plugins.ctrlsf"),
	{ "simeji/winresizer" },
	-- -- Otros ---------------
	-- require("plugins.obsidian")
	-- require("plugins.rust-tools"),
}, {
	-- Opciones globales para Lazy.nvim
	defaults = { lazy = false },
})
require("plugins.undotree")
require("plugins.autopairs")
--------------------------
require("autocompletado")
require("templates")
require("filetypes.typ")
-- Atajos ------------
require("atajos.atajos")
vim.cmd([[colorscheme catppuccin]])
