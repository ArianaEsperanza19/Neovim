local M = {}

M.show_keymaps = function()
	local keymaps = [[
    Clear Search Highlight:
    <leader>h: :nohlsearch<CR>

    Go to end
    <leader>.: $
    Go to beginning
    <leader>,: ^

    Leap:
    <enter> : leap forward to character under cursor
    <C-j> : leap-forward
    <C-k> : leap-backward
    After the keymaps add the two characters you want to jump to.
    Note: Include spaces.

    Ir a linea: nG
    n = line number

    Visual Navigation:
       <leader>j: gj
       <leader>k: gk

    Go to top from visible scream
    <Shift>h: Up
    <Shift>l: Down

    Content table:
    <leader>ct

    Buffer Navigation:
    -- Key mapping to switch to the next buffer
    zk: :bnext<CR>
    zj: :bprevious<CR>
    -- Key mapping to close the current buffer with saving changes
    <leader>e: :bd<CR>
    -- Key mapping to close the current buffer without saving changes
    zx<down>: :bd!<CR>
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
