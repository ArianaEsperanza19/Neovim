local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Clear Search Highlight:
       <leader>h: :nohlsearch<CR>

    Go to end
    <leader>.: $
    Go to beginning
    <leader>,: ^

    Ir a linea: nG

    Visual Navigation:
       <leader>j: gj
       <leader>k: gk

    Buffer Navigation:
    -- Key mapping to switch to the next buffer
    z<right>: :bnext<CR>
    z<left>: :bprevious<CR>
    -- Key mapping to close the current buffer with saving changes
    z<down>: :bd<CR>
    -- Key mapping to close the current buffer without saving changes
    zx<down>: :bd!<CR>
    -- Open vertical window
    <C>wv
    -- Open horizontal window
    <C>ws
    -- Close window
    <C>wc
    -- Move through windows
    <C>wk : up
    <C>wj : down
    <C>wh : left
    <C>wl : right

    File Manipulation in Neotree:
        -- Key mapping to open Neotree
        <leader>m: :NvimTreeToggle<CR>
        -- Default shortcuts to manipulate files
        a: Create a new file
        d: Delete file
        r: Rename file
        c: Copy file
        p: Paste file
        x: Cut file
        y: Copy file name
        <C-n>: Navigate to the next node
        <C-p>: Navigate to the previous node

    Bookmark Management with vim-bookmarks:
        mm: :BookmarkToggle<CR>
        mi: :BookmarkAnnotate<CR>
        ma: : Telescope vim-bookmarks<CR>
        mn: :BookmarkNext<CR>
        mp: :BookmarkPrev<CR>

    Telescope
    -- Open Telescope Navigator de archivos:
        <leader>ff: :Telescope find_files<CR>
    -- Open Telescope Searcher for text:
        <leader>t: :Telescope live_grep<CR>
    -- Open Telescope marks:
        <leader>fm: :Telescope marks<CR>
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

