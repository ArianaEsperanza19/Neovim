local M = {}

M.show_keymaps = function()
  local keymaps = [[
  Go to definition:
  <leader>zd: :lua require("telescope.builtin").lsp_definitions()<CR>
  Go to references:
  <leader>zx: :lua require("telescope.builtin").lsp_references()<CR>

  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M


