local M = {}

M.show_keymaps = function()
	local keymaps = [[
  -- Open DB UI
  :DBUI
  -- Url to connect to DB
  mysql://root@localhost:3306/laravel
  -- Structure of Url
  db :// user@host:port/database
  -- Without password
  db :// user:password@host:port/database
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
