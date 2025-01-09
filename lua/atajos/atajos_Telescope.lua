local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Telescope
    -- Open Navigator de archivos:
        <leader>ff: :Telescope find_files<CR>
    -- Open Searcher for text:
        <leader>t: :Telescope live_grep<CR>
    -- Open marks:
        <leader>fm: :Telescope marks<CR>
    Telescope & Abolish:
    -- Search text in all the files:
       <leader>tt: :Telescope grep_string<CR>
    -- Search and Replace locally
       <leader>ll + <C-r>:
    -- Search and Remplace globally
       <leader>gg + <C-r>:
    -- Search en Remplace electively in the current buffer:
       <leader>rc + <C-r>:
  ]]

  local Terminal  = require('toggleterm.terminal').Terminal
  local keymap_term = Terminal:new({
    cmd = "echo \""..keymaps.."\" | less",
    direction = "float",
    hidden = true,
  })
  keymap_term:toggle()
  -- vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

