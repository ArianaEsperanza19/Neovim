-- Telescope is a powerful search plugin for Neovim that provides a highly extensible and configurable command-line interface for searching files, text, and more. It uses a popup-based interface to display search results clearly and efficiently, greatly enhancing developer productivity.

local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- Asigna la combinación de teclas <leader>ff al comando de Telescope para buscar archivos
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

-- Asigna la combinación de teclas <leader>t al comando de Telescope para hacer búsqueda de texto en vivo (grep)
vim.api.nvim_set_keymap("n", "<leader>tt", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Asigna la combinación de teclas <leader>fb al comando de Telescope para listar y buscar entre buffers abiertos
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

-- Asigna la combinación de teclas <leader>fh al comando de Telescope para buscar entre las etiquetas de ayuda
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Keybindings para abrir los pickers de marcas de telescope
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
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

-- Telescope extension
require("telescope").load_extension("vim_bookmarks")
--require("telescope").load_extension("marks")
require("plugins/vimBookMarks")
