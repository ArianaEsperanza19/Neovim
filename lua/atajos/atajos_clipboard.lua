local M = {}

M.show_keymaps = function()
	local keymaps = [[
  -- Commands to Clipboard:
	-- Open Telescope Clipboard:
	<leader>cp: :Telescope registers<CR>
	------------------------------------
	-- To selected elements:
	<C-p> : Paste element from selected clipboard
	<C-d> : Delete element from selected clipboard
	<C-e> : Edit element from selected clipboard
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
