local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Telescope
    -- Open Navigator de archivos:
        <leader>ff: :Telescope find_files<CR>
    -- Open Searcher for text:
        <leader>t: :Telescope live_grep<CR>
    -- Open marks:
        <leader>fm: :Telescope marks<CR>
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
