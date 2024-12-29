local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Useful mappings for LaTeX:

    View
    <leader>lv: <cmd>VimtexView<CR>
    Compile and View
    <leader>lc: <cmd>VimtexCompile<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

