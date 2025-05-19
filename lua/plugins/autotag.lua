--INFO: nvim-ts-autotag is a plugin for Neovim that automatically generates HTML tags based on the structure of the code.
return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
