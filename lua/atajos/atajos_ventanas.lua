local M = {}

M.show_keymaps = function()
	local keymaps = [[
    -- Open vertical window
    <leader>wv
    -- Open horizontal window
    <leader>wh
    -- Close window
    <leader>we
    -- Close all the unactive windows
    <leader>wq
    -- Close all current windows
    <leader><Del>
    -- Move through windows
    <A-h> : left
    <A-l> : right
    <A-k> : up
    <A-j> : down
    -- Resize windows
    <leader>wr : Winresizer mode
    Resize mode : <C>e + movement
    movement : h, j, k, l
    Command: WinResizerStartResize
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
