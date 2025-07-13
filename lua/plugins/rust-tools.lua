return {
	"simrat39/rust-tools.nvim", -- Plugin de Rust
	config = function()
		-- Configuración personalizada para rust-tools
		require("rust-tools").setup({})
	end,
}
