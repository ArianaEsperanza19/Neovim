require("tokyonight").setup({
	style = "moon", -- Opciones: storm, moon, night, day
})

-- Activar el tema
vim.cmd.colorscheme("tokyonight")

-- return {
-- 	"folke/tokyonight.nvim", -- Tema de colores Tokyonight
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "moon", -- Estilo del tema
-- 		})
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- }
