local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Useful mappings for Markdown:

    Open or Close Preview in Navigator:
    <leader>sm
  ]]

	local Terminal = require("toggleterm.terminal").Terminal
	local keymap_term = Terminal:new({
		cmd = 'echo "' .. keymaps .. '" | less',
		direction = "float",
		hidden = true,
	})
	keymap_term:toggle()
	-- vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M
