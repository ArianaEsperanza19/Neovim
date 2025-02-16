local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Useful mappings for LaTeX:

    View
    <leader>lv: <cmd>VimtexView<CR>
    Compile and View
    <leader>lc: <cmd>VimtexCompile<CR>

    Snippets
    -- Letra
    /n : Negrita
    /k : Cursiva
    -- Secciones
    /sec : Sección
    /subsec : Subsección
    -- Index
    /tt : Encabezado
    -- Inserciones
    /fp : Pie de página
    /c : Cita
    /fig : Figura
    /enum : Lista enumerada
    /item : Lista desordenada
    /table : Tabla
  ]]

	local Terminal = require("toggleterm.terminal").Terminal
	local keymap_term = Terminal:new({
		cmd = 'echo "' .. keymaps .. '" | less',
		direction = "float",
		hidden = true,
	})
	keymap_term:toggle()
end

return M
