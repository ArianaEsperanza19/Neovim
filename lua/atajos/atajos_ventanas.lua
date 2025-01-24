local M = {}

M.show_keymaps = function()
	local keymaps = [[
    -- Open vertical window
    <leader>wv
    -- Open horizontal window
    <leader>wb
    -- Close window
    <leader>wc
    -- Move through windows
    <leader>wh : left
    <leader>wl : right
    <leader>wk : up
    <leader>wj : down
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
