-- INFO: NeoTree is a plugin for Neovim that provides a modern and highly configurable file explorer. It is similar to NERDTree but offers more functionalities and a more user-friendly interface. NeoTree allows you to navigate, create, delete, and rename files and folders directly from Neovim, improving project management efficiency.
return {
	{
		"nvim-tree/nvim-tree.lua", -- Plugin de NeoTree (NvimTree)
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Dependencia opcional para iconos
		config = function()
			-- Habilitar colores de terminal en Neovim
			vim.opt.termguicolors = true

			-- Función my_on_attach para nvim-tree
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- Mapeos predeterminados
				api.config.mappings.default_on_attach(bufnr)

				-- Mapeos personalizados
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end

			-- Configurar nvim-web-devicons
			require("nvim-web-devicons").setup({
				default = true,
			})

			-- Configurar NeoTree
			require("nvim-tree").setup({
				on_attach = my_on_attach, -- Función my_on_attach para manejar eventos adjuntos
				renderer = {
					icons = {
						glyphs = {
							default = "", -- Icono predeterminado para archivos
							symlink = "", -- Icono de enlace simbólico
							git = {
								unstaged = "✗", -- No preparado
								staged = "✓", -- Preparado
								unmerged = "", -- No fusionado
								renamed = "➜", -- Renombrado
								untracked = "★", -- No rastreado
								deleted = "", -- Eliminado
								ignored = "◌", -- Ignorado
							},
							folder = {
								default = "", -- Carpeta predeterminada
								open = "", -- Carpeta abierta
								empty = "", -- Carpeta vacía
								empty_open = "", -- Carpeta vacía abierta
								symlink = "", -- Carpeta enlace simbólico
								symlink_open = "", -- Carpeta enlace simbólico abierta
							},
						},
					},
				},
				view = {
					width = 30, -- Ancho del panel lateral
					side = "left", -- Lado en el que se abrirá NeoTree
					-- auto_close = true,  -- Opción comentada para cerrar automáticamente
				},
				actions = {
					open_file = {
						quit_on_open = true, -- Cierra NeoTree al abrir un archivo
					},
					change_dir = {
						enable = true,
						global = false,
					},
				},
			})

			-- Mapeo para abrir y cerrar NeoTree con <leader>m
			vim.api.nvim_set_keymap("n", "<leader>m", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
