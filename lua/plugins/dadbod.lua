-- This configuration integrates Dadbod with Neovim to manage and interact with databases seamlessly.
-- It requires the Dadbod plugin and proper keymaps to execute database commands.
-- Make sure to install Dadbod and set keymaps to effectively use this configuration.

local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- Completado basado en LSP
		{ name = "buffer" }, -- Completado basado en el buffer actual
		{ name = "vim-dadbod-completion" }, -- Completado para consultas SQL
	}),
})

-- Configuración de vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1 -- Usa iconos de Nerd Fonts
vim.g.db_ui_show_database_icon = 1 -- Muestra íconos de bases de datos
vim.g.db_ui_win_position = "left" -- Posición de la ventana
vim.g.db_ui_auto_execute_table_helpers = 1 -- Ejecuta automáticamente consultas básicas

-- Deshabilitar auto-órdenes
local function disable_autocmds()
	vim.api.nvim_exec(
		[[
    augroup my_autocmds
      autocmd!
    augroup END
  ]],
		false
	)
end

-- Habilitar auto-órdenes
local function enable_autocmds()
	vim.api.nvim_exec(
		[[
    augroup my_autocmds
      autocmd!
      autocmd BufWritePost * lua print("Buffer guardado")
      autocmd BufEnter * lua print("Entrando en un buffer")
    augroup END
  ]],
		false
	)
end

---

local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- Completado basado en LSP
		{ name = "buffer" }, -- Completado basado en el buffer actual
		{ name = "vim-dadbod-completion" }, -- Completado para consultas SQL
	}),
})

-- Configuración de vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1 -- Usa iconos de Nerd Fonts
vim.g.db_ui_show_database_icon = 1 -- Muestra íconos de bases de datos
vim.g.db_ui_win_position = "left" -- Posición de la ventana
vim.g.db_ui_auto_execute_table_helpers = 1 -- Ejecuta automáticamente consultas básicas

-- Deshabilitar auto-órdenes
local function disable_autocmds()
	vim.cmd([[
        augroup my_autocmds
            autocmd!
        augroup END
    ]])
end

-- Habilitar auto-órdenes
local function enable_autocmds()
	vim.cmd([[
        augroup my_autocmds
            autocmd!
            autocmd BufWritePost * lua print("Buffer guardado")
            autocmd BufEnter * lua print("Entrando en un buffer")
        augroup END
    ]])
end

-- Deshabilitar auto-órdenes al entrar en la UI de dadbod
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dadbodui",
	callback = disable_autocmds,
})

-- Habilitar auto-órdenes al salir de la UI de dadbod
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "dadbodui",
	callback = enable_autocmds,
})

-- mapear
vim.api.nvim_set_keymap("n", "<leader>db", ":tab DBUI<CR>", { noremap = true, silent = true })
