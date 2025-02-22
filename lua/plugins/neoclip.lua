--[[
    NeoClip es una herramienta para manejar el portapapeles en aplicaciones modernas, permitiendo copiar,
    pegar y gestionar texto, imágenes u otros datos. Requiere:
    - Entorno compatible (APIs del sistema operativo).
    - Permisos adecuados para acceder al portapapeles.
    - Compatibilidad con el lenguaje/framework utilizado.
    - Dependencias opcionales para formatos avanzados.
    Casos de uso: Copiar/pegar texto, historial de copias, manejo de imágenes o datos estructurados.
--]]
require("telescope").load_extension("neoclip")
-- Configuración principal de neoclip.lua
require("neoclip").setup({
	-- Historial y persistencia
	history = 1000, -- Guarda hasta 1000 elementos en el historial
	enable_persistent_history = true, -- Habilita el historial persistente entre sesiones
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3", -- Ruta de la base de datos

	-- Límite de longitud y sincronización
	length_limit = 1048576, -- Límite de longitud del contenido (en bytes)
	continuous_sync = false, -- Desactiva la sincronización continua

	-- Filtros y vista previa
	filter = nil, -- Sin filtros personalizados
	preview = true, -- Habilita la vista previa en Telescope

	-- Registros y macros
	default_register = '"', -- Usa el registro por defecto
	default_register_macros = "q", -- Guarda las macros en el registro "q"
	enable_macro_history = true, -- Habilita el historial de macros

	-- Opciones avanzadas
	content_spec_column = false, -- Desactiva columnas adicionales en la vista
	disable_keycodes_parsing = false, -- Habilita el análisis de códigos de teclas
	dedent_picker_display = false, -- Desactiva la dedentación en la vista
	initial_mode = "insert", -- Modo inicial al abrir Telescope

	-- Comportamiento al seleccionar/pastear
	on_select = {
		move_to_front = false, -- No mueve el elemento seleccionado al frente
		close_telescope = true, -- Cierra Telescope después de seleccionar
	},
	on_paste = {
		set_reg = false, -- No actualiza el registro automáticamente
		move_to_front = false, -- No mueve el elemento pegado al frente
		close_telescope = true, -- Cierra Telescope después de pegar
	},
	on_replay = {
		set_reg = false, -- No actualiza el registro al reproducir una macro
		move_to_front = false, -- No mueve la macro al frente
		close_telescope = true, -- Cierra Telescope después de reproducir
	},
	on_custom_action = {
		close_telescope = true, -- Cierra Telescope después de una acción personalizada
	},

	-- Atajos de teclado para Telescope
	keys = {
		telescope = {
			i = {
				select = "<cr>", -- Selecciona un elemento
				paste = "<c-p>", -- Pega el elemento seleccionado
				paste_behind = "<c-k>", -- Pega detrás del cursor
				replay = "<c-q>", -- Reproduce una macro
				delete = "<c-d>", -- Elimina un elemento
				edit = "<c-e>", -- Edita un elemento
				custom = {}, -- Acciones personalizadas
			},
			n = {
				select = "<cr>", -- Selecciona un elemento
				paste = "p", -- Pega el elemento seleccionado
				paste_behind = "P", -- Pega detrás del cursor
				replay = "q", -- Reproduce una macro
				delete = "d", -- Elimina un elemento
				edit = "e", -- Edita un elemento
				custom = {}, -- Acciones personalizadas
			},
		},
	},
})

-- Atajo personalizado para abrir el historial del portapapeles con Telescope
vim.api.nvim_set_keymap("n", "<leader>cp", ":Telescope neoclip<CR>", { noremap = true, silent = true })
