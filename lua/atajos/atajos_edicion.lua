local M = {}

M.show_keymaps = function()
	local keymaps = [[
    --Create New Lines Without Changing Mode:
      <leader>o: o<Esc>
      <leader>O: O<Esc>

    --Move line or selection:
      m+Up: Move line/selection up
      m+Down: Move line/selection down
      Note: Keep in mind that if there is text directly in the upper or lower line,
      it will just swap the lines.

    --Paste Over Selection with Clipboard Content:
      <C-v>

    --Apply Surrounds:
    --Add surrounds in N mode:
    Current line: ]y + simbol
    Lines before and after the current line:
    ]Y + simbol
    A specific number of lines:
    yS + number of lines + direction + simbol
    --Add simbols in V mode:
    Visual mode: "S" + simbol
    Visualline mode: "gS" + simbol
    --Delete & Change surrounds in N mode:
    Delete surrounding: ]d + simbol
    Change surrounding: ]f + simbol + new simbol

    <C-x><C-f> : Directory Hint

    -- Open Remplacing Toggle:
    Command: CtrlSF Searching
    <leader>ss : Search word bellow the cursor
    Open panel : <leader>sr
    Open where is the searching : enter || o
    Open searching in the right buffer: O
    Show in preview : p
    Show in preveiw and explore there : P
    Change:%s/old_word/new_word/g


    Apply Formatter: <leader>F

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
