-- ~/.config/nvim/lua/plugins/peek.lua
-- Peek es un plugin para Neovim que permite previsualizar archivos Markdown en tiempo real en tu navegador preferido.
-- Necesita Deno para funcionar correctamente.
--
-- Instalación de Deno:
-- curl -fsSL https://deno.land/x/install/install.sh | sh
-- Si el archivo main.bundle.js no esta en su lugar:
-- cd ~/.local/share/nvim/site/pack/packer/start/peek.nvim
-- Ve al directorio: "~/.local/share/nvim/site/pack/packer/start/peek.nvim"
-- Crealo manualmente con este comando
-- deno run --allow-run --allow-net --allow-read --allow-write --allow-env --no-check scripts/build.js
-- NOTA: Si usas Zathura para visualizar, instala xdotool: sudo apt install xdotool
-- Características:
-- - Carga automática de vista previa al abrir un archivo Markdown.
-- - Cierre automático de la vista previa al eliminar el buffer.
-- - Resaltado de sintaxis.
-- - Temas oscuro y claro.
-- - Actualización en tiempo real.
--
-- Atajo para abrir/cerrar Peek: <leader>sm

-- ~/.config/nvim/lua/plugins/peek.lua
require("peek").setup({
	auto_load = true, -- Cargar automáticamente la vista previa al entrar en un buffer markdown
	close_on_bdelete = true, -- Cerrar la ventana de vista previa al borrar el buffer

	syntax = true, -- Habilitar resaltado de sintaxis, puede afectar el rendimiento

	theme = "dark", -- 'dark' o 'light'

	update_on_change = true,

	app = "firefox", -- 'webview', 'browser', cadena de texto o una tabla de cadenas

	filetype = { "markdown" }, -- lista de tipos de archivos a reconocer como markdown

	-- relevante si update_on_change está activado
	throttle_at = 200000, -- empezar a limitar cuando el archivo exceda esta cantidad de bytes
	throttle_time = "auto", -- cantidad mínima de tiempo en milisegundos que debe pasar antes de iniciar un nuevo renderizado
})

local peek = require("peek")

-- Crear comandos para abrir y cerrar Peek
vim.api.nvim_create_user_command("PeekOpen", function()
	if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == "markdown" then
		vim.fn.system("i3-msg split horizontal")
		peek.open()
	end
end, {})

vim.api.nvim_create_user_command("PeekClose", function()
	if peek.is_open() then
		peek.close()
		vim.fn.system("i3-msg move left")
	end
end, {})

-- Añadir el atajo de teclado para abrir o cerrar Peek
vim.api.nvim_set_keymap("n", "<leader>sm", ":lua peek_toggle()<CR>", { noremap = true, silent = true })

-- Definir la función para alternar Peek
function _G.peek_toggle()
	if peek.is_open() then
		vim.cmd("PeekClose")
	else
		vim.cmd("PeekOpen")
	end
end
