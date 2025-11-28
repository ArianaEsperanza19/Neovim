return {
	"simrat39/rust-tools.nvim", -- Este plugin tiene un setup específico para RA
	ft = { "rust" },
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		server = {
			settings = {
				["rust-analyzer"] = {
					inlayHints = { enable = true },
				},
			},
		},
	},
}
