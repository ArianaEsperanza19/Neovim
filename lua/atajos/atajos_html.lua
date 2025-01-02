local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Jump-tag Shortcuts for HTML:

      Jump to Parent Tag:
        <leader>p: :lua require('jump-tag').jumpParent()<CR>
      Jump to Next Sibling Tag:
        <leader>]: :lua require('jump-tag').jumpNextSibling()<CR>
      Jump to Previous Sibling Tag:
        <leader>[: :lua require('jump-tag').jumpPrevSibling()<CR>
      Jump to Child Tag:
        <leader>c: :lua require('jump-tag').jumpChild()<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

