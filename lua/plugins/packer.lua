--NVIM v0.10.4
-- Problemas de compatibilidad con:
-- nvim-treesitter
-- trouble
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
	use("folke/tokyonight.nvim")
	-- Barra inferior, buffer y pestañas
	use("feline-nvim/feline.nvim") -- Barra
	use({ "akinsho/bufferline.nvim", tag = "*" })
	-- Ortografia
	use("sheerun/vim-polyglot") -- Corrector
	use({ "lervag/vimtex" }) -- Latex
	use("jalvesaq/dict.nvim")
	-- Markdown
	use({ "toppair/peek.nvim" })
	-- Visor
	use("goolord/alpha-nvim")
	use("nvim-tree/nvim-tree.lua") -- Arbol
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-tree/nvim-web-devicons") -- Iconos
	use("MunifTanjim/nui.nvim")
	-- Exploracion y Busqueda
	use({
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.8",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("tom-pollak/telescope-marks.nvim") -- Marcas
	use("MattesGroeger/vim-bookmarks") -- Marcas
	use("harrisoncramer/jump-tag") -- Jump Tag
	use("stevearc/aerial.nvim")
	use("ggandor/leap.nvim")
	-- Debug
	use({ "folke/trouble.nvim" }) -- Diagnostics
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
		run = "make install_jsregexp", -- Instalar jsregexp (opcional)
	})
	-- IA
	use({
		"Exafunction/codeium.vim",
		event = "BufEnter",
	})
	--use 'yetone/avante.nvim' -- no instalado, necesita neovim > 0.10.0
	use("numToStr/Comment.nvim") -- Comentar con atajo
	-- Calidad de vida
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({ "kylechui/nvim-surround" }) -- Sustituciones
	use("mbbill/undotree") -- Undo tree, arbol de historial
	use("simeji/winresizer")
	use("AckslD/nvim-neoclip.lua")
	use("dyng/ctrlsf.vim")
	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	-- Terminal
	use("akinsho/toggleterm.nvim")
	use("folke/snacks.nvim")
	use("folke/noice.nvim")
	-- DB
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")
	-- Otros
	use("epwalsh/obsidian.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end) -- Fin
