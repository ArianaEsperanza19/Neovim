-- INFO: Avante is a plugin to integrate AI tools with Neovim
-- Deepseek
--sk-ce6501b9f7f141f9a44719d492a97260
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		provider = "openai",
		providers = {
			gemini = {
				__inherited_from = "openai",
				endpoint = "https://openrouter.ai/api/v1",
				api_key_name = "GEMINI_API_KEY",
				model = "google/gemini-2.5-flash",
			},
			-- deepseek = {
			-- 	__inherited_from = "openai",
			-- 	endpoint = "https://openrouter.ai/api/v1",
			-- 	api_key_name = "DEEPSEEK_API_KEY",
			-- 	model = "deepseek/deepseek-r1",
			-- },
		},
	},
	build = "make", -- O usa el comando de PowerShell si estás en Windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.pick", -- Para file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- Para file_selector provider telescope
		"hrsh7th/nvim-cmp", -- Autocompletado para comandos y menciones
		"ibhagwan/fzf-lua", -- Para file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- Íconos para archivos
		{
			"HakonHarnes/img-clip.nvim", -- Soporte para pegar imágenes
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true, -- Requerido para usuarios de Windows
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim", -- Renderizado de Markdown
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
