local M = {}

M.show_keymaps = function()
	local keymaps = [[
		Telescope
	-- Open Navigator de archivos:
		<leader>ff: :Telescope find_files<CR>
	-- Open Searcher for text:
		<leader>tt: :Telescope live_grep<CR>
	-- Open Marks:
		ma :Telescope marks<CR>
	-- Open Messages:
		<leader>te :NoiceTelescope<CR>
	-- Open Clipboard:
		<leader>cp: :Telescope registers<CR>
	-- Open diferences of current file:
		Telescope git_bcommits<CR>
		Note: If you have no commited changes, they will desapear when you go to other commit.
	-- Open all commits:
		Telescope git_commits<CR>
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
