return {
	"folke/tokyonight.nvim", -- Tema de colores Tokyonight
	config = function()
		require("tokyonight").setup({
			style = "moon", -- "storm", "day", "moon" o "night"
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme
		})
		-- Colocar en init
		-- vim.cmd([[colorscheme tokyonight]])
	end,
}
