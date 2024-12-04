-- Neovim API aliases 

local cmd = vim.cmd
local exec = vim.api.nvim_command
local fn = vim.fn
local g = vim.g
local opt = vim.opt
-- General
g.mapleader = ';'
-- VI
opt.number = true
opt.relativenumber = true
-- Ortografia
cmd([[
augroup tex_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.tex set filetype=latex
augroup END

  augroup SpellCheck
    autocmd!
    autocmd FileType tex,markdown,text setlocal spell spelllang=es
  augroup END
]])

-- Tabulacion
opt.listchars = { tab = '▸ ', trail = '»' }
opt.list = true
cmd [[highlight TabHighlight ctermfg=11 guifg=#FFD700]]

-- Desactivar un autocomando específico
vim.api.nvim_clear_autocmds({ event = {"TextChanged", "TextChangedI"}, pattern = "*" })
-- Desactivar un autocomando específico
vim.api.nvim_clear_autocmds({ event = {"TextChanged", "TextChangedI"}, pattern = "*" })

-- Configurar el mapeo para borrar sin copiar al registro
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })


