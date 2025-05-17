return {
	"folke/tokyonight.nvim", -- Tema de colores Tokyonight
	config = function()
		require("tokyonight").setup({
			style = "moon", -- "storm", "day", "moon" o "night"
		})
		-- Colocar en init
		-- vim.cmd([[colorscheme tokyonight]])
	end,
}
