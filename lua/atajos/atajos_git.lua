local M = {}

M.show_keymaps = function()
  local keymaps = [[

  -- Gitsigns
  -- Watch current hunk (enter to leave)
  <leader><F4>: :Gitsigns preview_hunk<CR>

  -- Next hunk
  ]c: :Gitsigns next_hunk<CR>
  -- Previous hunk
  [c: :Gitsigns prev_hunk<CR>

  -- Show current line blame
  <F4>: :Gitsigns toggle_current_line_blame<CR>

  -- Borrar buffer actual
  :Gitsigns reset_buffer<CR>


  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M
