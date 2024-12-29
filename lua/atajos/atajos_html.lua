local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Jump-tag Shortcuts for HTML:

      Jump to Parent Tag:
        <leader>jt: :lua require('jump-tag').jumpParent()<CR>
      Jump to Next Sibling Tag:
        <leader>jn: :lua require('jump-tag').jumpNextSibling()<CR>
      Jump to Previous Sibling Tag:
        <leader>jp: :lua require('jump-tag').jumpPrevSibling()<CR>
      Jump to Child Tag:
        <leader>jc: :lua require('jump-tag').jumpChild()<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

