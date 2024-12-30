local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Useful mappings for Markdown:

    Open or Close Preview in Navigator:
    <leader>sm
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M


