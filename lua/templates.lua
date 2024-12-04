-- Función para reemplazar variables en la plantilla
local function reemplazar_variables(template)
    local author = vim.fn.systemlist("git config user.name")[1] or "Autor Desconocido"
    template = string.gsub(template, "{{AUTHOR}}", author)
    template = string.gsub(template, "{{DATE}}", os.date("%Y-%m-%d"))
    template = string.gsub(template, "{{LICENSE}}", "Licencia Desconocida")
    return template
end

-- Crear autocomando para cargar plantillas en archivos nuevos
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.html", "*.css", "*.tex"},
    callback = function()
        local file_extension = vim.fn.expand("%:e")
        local template_path = string.format("%s/templates/%s.tpl", vim.fn.stdpath("config"), file_extension)
        if vim.fn.filereadable(template_path) == 1 then
            local template = table.concat(vim.fn.readfile(template_path), "\n")
            template = reemplazar_variables(template)
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
        end
    end,
})

