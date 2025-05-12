-- INFO: Bufferline provides a visual tab bar for open buffers in Neovim, allowing for easier and more intuitive management of multiple buffers. It helps to quickly navigate between open files and visually track which files are currently open, enhancing productivity and workflow.
return {
	"akinsho/bufferline.nvim", -- Plugin de Bufferline
	version = "*", -- Usar la última versión disponible
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Dependencia opcional para iconos
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "ordinal", -- Mostrar números ordinales
				show_buffer_icons = true, -- Mostrar iconos de archivos
				show_buffer_close_icons = true, -- Mostrar iconos para cerrar buffers
				separator_style = "thick", -- Estilo de separadores ("slant", "thick", "thin", etc.)
				diagnostics = "nvim_lsp", -- Mostrar diagnósticos de LSP
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = {
				fill = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "bg"),
				},
				background = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg"),
				},
				buffer_visible = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg"),
				},
				buffer_selected = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "bg"),
					gui = "bold",
				},
				separator = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "bg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "bg"),
				},
				separator_selected = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "bg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "bg"),
				},
				separator_visible = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineFill"), "bg"),
				},
				indicator_selected = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "bg"),
				},
				modified = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg"),
				},
				modified_visible = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLine"), "bg"),
				},
				modified_selected = {
					guifg = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg"),
					guibg = vim.fn.synIDattr(vim.fn.hlID("TabLineSel"), "bg"),
				},
			},
		})
	end,
}
