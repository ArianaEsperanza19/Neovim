local M = {}

M.show_keymaps = function()
	local keymaps = [[
  -- SQL Queries
  :DB URL `Query`
  -- Open DB UI
  :DBUI
  -- Url to connect to DB
  mysql://<user>:<password>@<host>:<port>/[database]
  mysql://root@localhost:3306/laravel
  -- Create alias for url
	vim.g.alias = "mysql://root@localhost:3306/DataBase"
  -- To do a query
  :DB g:alias `Query`

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
