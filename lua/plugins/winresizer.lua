-- Asignar el atajo <leader>wr para ejecutar WinResizerStartResize
vim.api.nvim_set_keymap("n", "<leader>wr", ":WinResizerStartResize<CR>", { noremap = true, silent = true })
