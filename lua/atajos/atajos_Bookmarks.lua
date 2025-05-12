local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Bookmark Management with vim-bookmarks:
        mm: :BookmarkToggle<CR>
        mi: :BookmarkAnnotate<CR>
        mn: :BookmarkNext<CR>
        mp: :BookmarkPrev<CR>
        ma: :Telescope vim-bookmarks<CR>
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
