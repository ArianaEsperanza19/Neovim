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
	-- Aquí se definen tus plugins
}, {
	-- Opciones globales para Lazy.nvim
	defaults = { lazy = true }, -- Todos los plugins son cargados de forma diferida (lazy loading)
})
