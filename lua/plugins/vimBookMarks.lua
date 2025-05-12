-- INFO: vim-bookmarks is a Vim plugin that allows setting and managing bookmarks in specific lines of your files. These bookmarks can be used to mark important lines, and you can navigate between them easily. Annotations can also be added to bookmarks, which is useful for preparing code reviews.
-- Configurar vim-bookmarks
return {
	"MattesGroeger/vim-bookmarks", -- Plugin de bookmarks
	config = function()
		-- Configuración personalizada para vim-bookmarks
		vim.g.bookmark_sign = "🔖"
		vim.g.bookmark_annotation_sign = "📝"
		vim.g.bookmark_auto_save = 1
		vim.g.bookmark_auto_close = 1
	end,
}
