-- INFO: Telescope is a plugin for Neovim that provides a fast and flexible tool for finding and navigating through files, buffers, and other items in your workspace.
return {
	{
		"nvim-telescope/telescope.nvim", -- Plugin principal de Telescope
		dependencies = {
			"nvim-lua/plenary.nvim", -- Dependencia requerida por Telescope
			"nvim-tree/nvim-web-devicons", -- Dependencia opcional para iconos
			"MattesGroeger/vim-bookmarks", -- Plugin para manejar bookmarks
			"tom-pollak/telescope-marks.nvim",
		},
		config = function()
			-- Importar módulos necesarios
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			-- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

			-- Asigna la combinación de teclas <leader>t al comando de Telescope para hacer búsqueda de texto en vivo (grep)
			vim.api.nvim_set_keymap("n", "<leader>tt", ":Telescope live_grep<CR>", { noremap = true, silent = true })

			-- Asigna la combinación de teclas <leader>fb al comando de Telescope para listar y buscar entre buffers abiertos
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

			-- Asigna la combinación de teclas <leader>fh al comando de Telescope para buscar entre las etiquetas de ayuda
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			-- Configuración de Telescope
			telescope.setup({
				defaults = {
					mappings = {
						i = { ["<c-t>"] = require("trouble.sources.telescope").open },
						n = { ["<c-t>"] = require("trouble.sources.telescope").open },
					},
				},
				extensions = {
					bookmarks = {
						sources = {
							{ "bookmarks", "Bookmarks" },
						},
						mappings = {
							i = {
								["ma"] = actions.select_default,
							},
						},
					},
				},
			})

			-- Cargar extensiones de Telescope
			require("telescope").load_extension("vim_bookmarks")
		end,
	},
	require("plugins.vimBookMarks"),
}
