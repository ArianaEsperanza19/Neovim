local M = {}

M.show_keymaps = function()
	local keymaps = [[
  Go to definition:
  <leader>zd: :lua require("telescope.builtin").lsp_definitions()<CR>
  Go to references:
  <leader>zx: :lua require("telescope.builtin").lsp_references()<CR>
  Show info about element:
  <leader>zh: :lua vim.lsp.buf.hover()<CR> || enter to close
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
