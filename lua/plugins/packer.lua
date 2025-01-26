local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer
	-- Temas
	use("cocopon/iceberg.vim")
	use("catppuccin/nvim")
	use("ellisonleao/gruvbox.nvim")
	-- Barra inferior, buffer y pestañas
	use("feline-nvim/feline.nvim") -- Barra
	use({ "akinsho/bufferline.nvim", tag = "*" })
	-- Ortografia
	use("sheerun/vim-polyglot") -- Corrector
	use({ "lervag/vimtex", commit = "cb94dd3e23cd983082bd01853347b9b1347719e7" }) -- Latex
	-- Markdown
	use({ "toppair/peek.nvim" })
	-- Visor
	use("nvim-tree/nvim-tree.lua") -- Arbol
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "f197a15b0d1e8d555263af20add51450e5aaa1f0",
		run = ":TSUpdate",
	})
	use("nvim-tree/nvim-web-devicons") -- Iconos
	use("MunifTanjim/nui.nvim")
	-- Exploracion y Busqueda
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("tom-pollak/telescope-marks.nvim") -- Marcas
	use("MattesGroeger/vim-bookmarks") -- Marcas
	use("tpope/vim-abolish") -- Busqueda y sustitucion avanzada
	use("harrisoncramer/jump-tag") -- Jump Tag
	-- Debug
	use({ "folke/trouble.nvim", commit = "40c5317" }) -- Diagnostics
	use("mfussenegger/nvim-dap")
	-- Autocompletacion y snippets
	use("neovim/nvim-lspconfig") -- LSP
	use("williamboman/mason.nvim") -- Mason
	use("VonHeikemen/lsp-zero.nvim") -- LSP Zero
	use("williamboman/mason-lspconfig.nvim") -- Mason
	use({ "nvimtools/none-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("hrsh7th/nvim-cmp") -- Motor principal de autocompletado
	use("hrsh7th/cmp-nvim-lsp") -- Integración con LSP
	use("hrsh7th/cmp-buffer") -- Fuente de autocompletado para el contenido del buffer
	use("hrsh7th/cmp-path") -- Fuente de autocompletado para archivos del sistema
	use("saadparwaiz1/cmp_luasnip") -- Fuente para LuaSnip
	use({
		"L3MON4D3/LuaSnip",
		commit = "85c9b3edaa6f5a75bb1d24dc180c15eaea77ad9d",
		run = "make install_jsregexp", -- Instalar jsregexp (opcional)
	})
	-- IA
	use({
		"Exafunction/codeium.vim",
		event = "BufEnter",
	})
	--use 'yetone/avante.nvim'
	use("numToStr/Comment.nvim") -- Comentar con atajo
	-- Calidad de vida
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("kylechui/nvim-surround")
	use("mbbill/undotree")
	-- use("simeji/winresizer")
	-- Git
	use("tpope/vim-fugitive")
	use({ "lewis6991/gitsigns.nvim", commit = " 0b04035" })
	-- Terminal
	use("akinsho/toggleterm.nvim")
	-- Otros
	if packer_bootstrap then
		require("packer").sync()
	end
end) -- Fin
