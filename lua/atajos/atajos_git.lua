local M = {}

M.show_keymaps = function()
	local keymaps = [[
  -- Gitsigns
  -- Watch current hunk (enter to leave)
  <leader>sh: :Gitsigns preview_hunk<CR>

  -- Next hunk
  ]c: :Gitsigns next_hunk<CR>
  -- Previous hunk
  [c: :Gitsigns prev_hunk<CR>
  -- Undo hunk
  ]u: :Gitsigns undo_hunk<CR>
  -- Undu stage hunk
  :Gitsigns undo_stage_hunk<CR>
  -- Highlight hunk
  :Gitsigns toggle_linehl<CR>

  -- Show current line blame
  <F4>: :Gitsigns toggle_current_line_blame<CR>
  -- Show the last commit
  :Gitsigns blame_line<CR>

  -- Reset current buffer to last commit
  :Gitsigns reset_buffer<CR>
  -- Reset all no confirmed changes to last commit
  :Gitsigns reset_buffer_index<CR>
  -- Reset all changes of this buffer to last commit
  :Gitsigns reset_base<CR>

  -- Show differences in buffer
  <leader>wg: :Gvimdiffsplit <bratch o commit><CR>
  :Gitsigns diffthis<CR>

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
