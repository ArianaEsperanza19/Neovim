local M = {}

M.show_keymaps = function()
  local keymaps = [[
    Eliminar resaltado de búsqueda:
       <leader>h: :nohlsearch<CR>

    Navegación Visual:
       <leader>j: gj
       <leader>k: gk

    Navegación entre Buffers:
        -- Mapeo para cambiar al siguiente buffer
        z<right>: :bnext<CR>
        z<left>: :bprevious<CR>
        -- Mapeo para cerrar el buffer actual guardando cambios
        z<down>: :bd<CR>
        -- Mapeo para cerrar el buffer actual sin guardar cambios
        zx<down>: :bd!<CR>

    Manipulación de Archivos en Neotree:
        -- Mapeo para abrir Neotree
        <leader>m: :NvimTreeToggle<CR>
        -- Atajos predeterminados para manipular archivos
        a: Crear un nuevo archivo
        d: Eliminar archivo
        r: Renombrar archivo
        c: Copiar archivo
        p: Pegar archivo
        x: Cortar archivo
        y: Copiar nombre del archivo
        <C-n>: Navegar al siguiente nodo
        <C-p>: Navegar al nodo anterior

    Gestión de Marcas con vim-bookmarks:
        mm: :BookmarkToggle<CR>
        mi: :BookmarkAnnotate<CR>
        ma: :BookmarkShowAll<CR>
        mn: :BookmarkNext<CR>
        mp: :BookmarkPrev<CR>

    Abrir Telescope marks:
        <leader>fm: :Telescope marks<CR>
  ]]

  vim.api.nvim_echo({{keymaps, "Normal"}}, true, {})
end

return M

