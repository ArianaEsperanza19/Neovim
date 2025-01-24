local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Create New Lines Without Changing Mode:
      <leader>o: o<Esc>
      <leader>O: O<Esc>

    Move line or selection:
      m+Up: Move line/selection up
      m+Down: Move line/selection down
      Note: Keep in mind that if there is text directly in the upper or lower line,
      it will just swap the lines.

    Paste Over Selection with Clipboard Content:
      <C-v>

    Apply surrounds:
    Visual mode: "S" + simbol
    Visualline mode: "gS" + simbol
    Delete & Change surrounds:
    Delete surrounding: ]d + simbol
    Change surrounding: ]f + simbol

    Format with LSP:
      <leader>F

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
