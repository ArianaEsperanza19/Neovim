-- Instalador de Lazy.nvim
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
require("lazy").setup({})
-- Una vez reconocido Lazy.nvim, cambia el nombre al verdader init.lua
