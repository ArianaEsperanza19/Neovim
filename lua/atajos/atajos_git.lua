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
  -- Stage hunk
  ]U: :Gitsigns stage_hunk<CR>
  -- Undo hunk
  ]u: :Gitsigns undo_hunk<CR>
  -- Undo stage hunk
  :Gitsigns undo_stage_hunk<CR>
  -- Highlight hunk
  :Gitsigns toggle_linehl<CR>

  -- Show commits and its diffs
  :Gllog<CR>
  -- Show commits & its diffs for a specific branch
  :Gllog <branch><CR>
  -- Show current line blame
  <F4>: :Gitsigns toggle_current_line_blame<CR>
  -- Show the last commit
  :Gitsigns blame_line<CR>
  --- Telescope
  --:Telescope git_commits<CR> -- Show all commits
  --:Telescope git_bcommits<CR> -- Show current buffer commits
  --Note: If you have no commited changes, they will desapear when you go to other commit.

  -- Reset all no confirmed changes to last commit
  -- (In the current buffer)
  :Gitsigns reset_buffer<CR>
  -- Reset current staging to last commit
  :Gitsigns reset_buffer_index<CR>
  -- Reset all no confirmed changes to last commit
  -- (In ALL files in the directory)
  :Gitsigns reset<CR>
  -- Resent AMBSOLUTLY ALL changes to last commit
  :Greset --hard --mixed<CR>

  -- Show differences in buffer to last commit
  <leader>wg: :Gvimdiffsplit<CR>
  :Gitsigns diffthis<CR>
  -- Show differences in buffer to a specific commit or branch
  :Gvimdiffsplit <bratch o commit><CR>
  -- Show differences in buffer to staged changes
  :Gdiff<CR>

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
