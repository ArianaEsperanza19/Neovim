-- vim-bookmarks is a Vim plugin that allows setting and managing bookmarks in specific lines of your files. These bookmarks can be used to mark important lines, and you can navigate between them easily. Annotations can also be added to bookmarks, which is useful for preparing code reviews.
-- Configurar vim-bookmarks
-- Atajos para gestionar las marcas con vim-bookmarks
vim.api.nvim_set_keymap("n", "mm", ":BookmarkToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mi", ":BookmarkAnnotate<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mn", ":BookmarkNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mp", ":BookmarkPrev<CR>", { noremap = true, silent = true })

-- Asigna la combinación de teclas ma al comando de Telescope para mostrar las marcas
vim.keymap.set("n", "ma", "<cmd>Telescope vim_bookmarks<CR>", { desc = "Telescope bookmarks" })

-- Configura bookmarks persistentes
vim.g.bookmark_auto_save = 1
vim.g.bookmark_auto_save_file = vim.fn.expand("~/.vim-bookmarks")
