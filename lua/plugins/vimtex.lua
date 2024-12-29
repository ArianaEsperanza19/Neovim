-- vimtex is a modern Vim and Neovim filetype and syntax plugin for LaTeX files[_{{{CITATION{{{_1{GitHub - lervag/vimtex: VimTeX: A modern Vim and neovim filetype plugin ...](https://github.com/lervag/vimtex). It provides features like compilation, tag navigation, syntax highlighting, and more.

-- Archivos latex son reconocidos como .tex
vim.api.nvim_exec([[
  augroup tex_filetype
    autocmd!
    autocmd BufRead,BufNewFile *.tex set filetype=tex
  augroup END
]], false)

vim.g.vimtex_view_method = 'zathura'  -- Ajusta esto según el visor de PDF que prefieras
vim.g.vimtex_compiler_method = 'latexmk'  -- Usa latexmk para compilar
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode = 0  -- Desactiva quickfix por defecto

-- Mapeos útiles para LaTeX
vim.api.nvim_set_keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>VimtexCompile<CR>', { noremap = true, silent = true })

