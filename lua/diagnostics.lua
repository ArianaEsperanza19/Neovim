-- ~/.config/nvim/lua/diagnostics.lua
local M = {}

M.toggle_diagnostics = function()
  local diagnostics_active = vim.b.diagnostics_active

  if diagnostics_active == nil then
    diagnostics_active = true
  end

  if diagnostics_active then
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  else
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  end

  vim.b.diagnostics_active = not diagnostics_active
end

return M

