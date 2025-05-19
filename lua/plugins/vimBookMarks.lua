-- INFO: vim-bookmarks is a Vim plugin that allows setting and managing bookmarks in specific lines of your files. These bookmarks can be used to mark important lines, and you can navigate between them easily. Annotations can also be added to bookmarks, which is useful for preparing code reviews.
-- Configurar vim-bookmarks
return {
	"MattesGroeger/vim-bookmarks", -- Plugin de bookmarks
	config = function()
		-- Configuración personalizada para vim-bookmarks
		vim.g.bookmark_sign = "󰓹"
		vim.g.bookmark_annotation_sign = "󰓽"
		vim.g.bookmark_auto_save = 1
		vim.g.bookmark_auto_close = 1
		vim.g.bookmark_sign_priority = 10
		-- Obtener el color del grupo de resaltado actual
		local function get_hl_color(group, attr)
			local hl = vim.api.nvim_get_hl_by_name(group, true)
			return string.format("#%06x", hl[attr] or 0xFFFFFF) -- Color por defecto blanco si no se encuentra
		end

		-- Aplicar los colores del esquema actual a los bookmarks
		vim.cmd(string.format("highlight BookmarkSign guifg=%s gui=bold", get_hl_color("WarningMsg", "foreground")))
		vim.cmd(
			string.format("highlight BookmarkAnnotationSign guifg=%s gui=bold", get_hl_color("String", "foreground"))
		)
	end,
}
